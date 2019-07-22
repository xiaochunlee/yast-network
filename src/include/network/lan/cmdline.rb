# encoding: utf-8

# ***************************************************************************
#
# Copyright (c) 2012 Novell, Inc.
# All Rights Reserved.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.   See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, contact Novell, Inc.
#
# To contact Novell about this file by physical or electronic mail,
# you may find current contact information at www.novell.com
#
# **************************************************************************
# File:	lan/cmdline.ycp
# Package:	Network configuration
# Summary:	Network cards cmdline handlers
# Authors:	Michal Svec <msvec@suse.cz>
#

require "shellwords"
require "y2network/interface_config_builder"
require "y2network/boot_protocol"

module Yast
  module NetworkLanCmdlineInclude
    def initialize_network_lan_cmdline(_include_target)
      textdomain "network"

      Yast.import "CommandLine"
      Yast.import "Label"
      Yast.import "Lan"
      Yast.import "NetworkInterfaces"
      Yast.import "RichText"
      Yast.import "Report"
      Yast.import "LanItems"
      Yast.import "Map"
    end

    def getConfigList(config_filter)
      confList = []
      count = -1
      LanItems.BuildLanOverview
      # list<map<string,any> > overview = (list<map<string,any> >)LanItems::Overview();
      Builtins.foreach(LanItems.Items) do |position, _row|
        LanItems.current = position
        count = Ops.add(count, 1)
        if Ops.greater_than(
          Builtins.size(Ops.get_string(LanItems.getCurrentItem, "ifcfg", "")),
          0
        )
          next if config_filter == "unconfigured"
        elsif config_filter == "configured"
          next
        end
        confList = Builtins.add(
          confList,
          Builtins.tostring(count) => {
            "id"         => position,
            "rich_descr" => Ops.get_string(
              LanItems.getCurrentItem,
              ["table_descr", "rich_descr"],
              ""
            ),
            "descr"      => Ops.get_string(
              LanItems.getCurrentItem,
              ["table_descr", "table_descr", 0],
              ""
            ),
            "addr"       => Ops.get_string(
              LanItems.getCurrentItem,
              ["table_descr", "table_descr", 1],
              ""
            )
          }
        )
      end
      deep_copy(confList)
    end

    def validateId(options, config)
      if !options["id"]
        Report.Error(_("Use \"id\" option to determine device."))
        return false
      end

      begin
        id = Integer(options["id"])
      rescue ArgumentError
        Report.Error(_("Invalid value '%s' for \"id\" option.") % options["id"])
        return false
      end

      if id >= config.size
        Report.Error(
          _("Value of \"id\" is out of range. Use \"list\" option to check max. value of \"id\".")
        )
        return false
      end
      true
    end

    def getItem(options, config)
      options = deep_copy(options)
      config = deep_copy(config)
      ret = -1
      Builtins.foreach(config) do |row|
        if Ops.get(options, "id", "0") == Ops.get_string(Map.Keys(row), 0, "")
          ret = Builtins.tointeger(Ops.get_string(Map.Keys(row), 0, "-1"))
        end
      end
      Builtins.y2error("Device not matched!") if ret == -1
      ret
    end

    # Handler for action "show"
    # @param [Hash{String => String}] options action options
    def ShowHandler(options)
      config = getConfigList("")
      return false unless validateId(options, config)

      required_id = options["id"]
      config.each do |row|
        row.each_pair do |key, value|
          next if key != required_id

          # create plain text from formated HTML
          descr = value["rich_descr"]
          descr.gsub!(/(<br>)|(<\/li>)/, "\n")
          descr.gsub!(/<[^>]+>/, "")

          # to keep it backward compatible. Previously echo was called which adds additional new line"
          descr << "\n"

          CommandLine.Print(descr)
        end
      end
      true
    end

    def ListHandler(options)
      options = deep_copy(options)
      config_filter = ""
      if Builtins.contains(Map.Keys(options), "configured")
        config_filter = "configured"
      end
      if Builtins.contains(Map.Keys(options), "unconfigured")
        config_filter = "unconfigured"
      end
      confList = getConfigList(config_filter)
      if Ops.greater_than(Builtins.size(confList), 0)
        CommandLine.Print("id\tname, \t\t\tbootproto")
      end
      Builtins.foreach(confList) do |row|
        Builtins.foreach(
          Convert.convert(
            row,
            from: "map <string, any>",
            to:   "map <string, map <string, any>>"
          )
        ) do |id, detail|
          CommandLine.Print(
            Builtins.sformat(
              "%1\t%2, %3",
              id,
              Ops.get_string(detail, "descr", ""),
              Ops.get_string(detail, "addr", "")
            )
          )
        end
      end
      true
    end

    # Handler for action "add"
    # @param [Hash{String => String}] options action options
    def AddHandler(options)
      LanItems.AddNew
      Lan.Add
      LanItems.Items[LanItems.current]["ifcfg"] = options.fetch("name", "")
      LanItems.type = options.fetch("type", infered_type(options))
      if LanItems.type.empty?
        Report.Error(_("The device type is mandatory."))
        return false
      end

      builder = Y2Network::InterfaceConfigBuilder.for(LanItems.type)
      builder.name = LanItems.GetCurrentName()
      update_builder_from_options!(builder, options)

      return false unless validate_config(builder)

      LanItems.Commit(builder)
      ListHandler({})

      true
    end

    # Handler for action "edit"
    # @param [Hash{String => String}] options action options
    def EditHandler(options)
      config = getConfigList("")

      return false if validateId(options, config) == false

      LanItems.current = getItem(options, config)
      builder = Y2Network::InterfaceConfigBuilder.for(LanItems.GetCurrentType())
      builder.name = LanItems.GetCurrentName()
      LanItems.SetItem(builder: builder)
      update_builder_from_options!(builder, options)

      return false unless validate_config(builder)

      LanItems.Commit(builder)
      ShowHandler(options)
      true
    end

    # Handler for action "delete"
    # @param [Hash{String => String}] options action options
    def DeleteHandler(options)
      config = getConfigList("")
      return false if validateId(options, config) == false
      Builtins.foreach(config) do |row|
        Builtins.foreach(
          Convert.convert(
            row,
            from: "map <string, any>",
            to:   "map <string, map <string, any>>"
          )
        ) do |key, value|
          if key == Ops.get(options, "id", "0")
            LanItems.current = Builtins.tointeger(
              Ops.get_integer(value, "id", -1)
            )
            Lan.Delete
            CommandLine.Print(_("The device was deleted."))
          end
        end
      end

      true
    end

  private

    # Return the infered type from the given options or an empty string if no
    # one infered.
    #
    # @param options [Hash{String => String}] action options
    # @return [String] infered device type; an empty string if not infered
    def infered_type(options)
      return "bond" if options.include? "slaves"
      return "vlan" if options.include? "ethdevice"
      return "br"   if options.include? "bridge_ports"

      ""
    end

    # Convenience method to validate some specific options like the STARTMODE,
    # BOOTPROTO and the IPADDR reporting an error in case of invalid
    #
    # @param builder [Y2Network::InterfaceConfigBuilder]
    # @return [Boolean] true when the options are valid; false otherwise
    def validate_config(builder)
      if Y2Network::BootProtocol.all.none? { |bp| bp.name == builder["BOOTPROTO"] }
        Report.Error(_("Impossible value for bootproto."))
        return false
      end

      if builder["BOOTPROTO"] == "static" && builder["IPADDR"].empty?
        Report.Error(
          _("For static configuration, the \"ip\" option is needed.")
        )
        return false
      end

      unless ["auto", "ifplugd", "nfsroot"].include? builder["STARTMODE"]
        Report.Error(_("Impossible value for startmode."))
        return false
      end

      true
    end

    # Convenience method to update the builder internal state taking in account
    # the given options
    #
    # @param builder [Y2Network::InterfaceConfigBuilder]
    # @param options [Hash{String => String}] action options
    def update_builder_from_options!(builder, options)
      case builder.type.short_name
      when "bond"
        builder["BOND_SLAVES"] = options.fetch("slaves", "").split(" ")
      when "vlan"
        builder["ETHERDEVICE"] = options.fetch("ethdevice", "")
      when "br"
        builder["BRIDGE_PORTS"] = options.fetch("bridge_ports", "")
      end

      default_bootproto = options.keys.include?("ip") ? "static" : "none"
      builder["BOOTPROTO"] = options.fetch("bootproto", default_bootproto)
      if builder["BOOTPROTO"] == "static"
        builder["IPADDR"] = options.fetch("ip", "")
        builder["PREFIX"] = options.fetch("prefix", "")
        builder["NETMASK"] = options.fetch("netmask", "255.255.255.0") if builder["PREFIX"].empty?
      else
        builder["IPADDR"] = ""
        builder["NETMASK"] = ""
      end
      builder["STARTMODE"] = options.fetch("startmode", "auto")
    end
  end
end
