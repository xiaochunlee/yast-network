# Copyright (c) [2019] SUSE LLC
#
# All Rights Reserved.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of version 2 of the GNU General Public License as published
# by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, contact SUSE LLC.
#
# To contact SUSE LLC about this file by physical or electronic mail, you may
# find current contact information at www.suse.com.

require "yast"
require "y2network/driver"

module Y2Network
  class HardwareWrapper
    def initialize
      Yast.include self, "network/routines.rb"
    end
  end

  # Stores useful (from networking POV) items of hwinfo for an interface
  # FIXME: decide whether it should read hwinfo (on demand or at once) for a network
  # device and store only necessary info or just parse provided hash
  class Hwinfo
    attr_reader :hwinfo

    def initialize(name:)
      # FIXME: store only what's needed.
      @hwinfo = load_hwinfo(name)
    end

    # Shortcuts for accessing hwinfo items. Each hwinfo item has own method for reading
    # its value. There are two exceptions however. First exception is hwinfo["name"] item
    # which carries device model human friendly description. This item is accessible via
    # {Hwinfo::description}. Second exception is hwinfo["dev_name"] item which can be read
    # through {Hwinfo::dev_name} or its alias {Hwinfo::name}.
    #
    # @!method dev_name read value of hwinfo["dev_name"]
    #   @return [String]
    # @!method mac read value of hwinfo["mac"]
    #   @return [String]
    # @!method busid read value of hwinfo["busid"]
    #   @return [String]
    # @!method link read value of hwinfo["link"]
    #   @return [Boolean]
    # @!method driver read value of hwinfo["driver"]
    #   @return [String]
    # @!method drivers read value of hwinfo["drivers"]
    #   @return [Array<String>]
    # @!method requires read value of hwinfo["requires"]
    #   @return [Array<String>]
    # @!method hotplug read value of hwinfo["hotplug"]
    #   @return [Boolean]
    # @!method module read value of hwinfo["module"]
    #   @return [String]
    # @!method wl_auth_modes read value of hwinfo["wl_auth_modes"]
    #   @return [String]
    # @!method wl_enc_modes read value of hwinfo["wl_enc_modes"]
    #   @return [Array<String>,nil]
    # @!method wl_channels read value of hwinfo["wl_channels"]
    #   @return [Array<String>, nil]
    # @!method wl_bitrates read value of hwinfo["wl_bitrates"]
    #   @return [String,nil]
    [
      { name: "dev_name", default: "" },
      { name: "mac", default: "" },
      { name: "busid", default: "" },
      { name: "link", default: false },
      { name: "driver", default: "" },
      { name: "module", default: nil },
      { name: "requires", default: [] },
      { name: "hotplug", default: false },
      { name: "wl_auth_modes", default: "" },
      { name: "wl_enc_modes", default: nil },
      { name: "wl_channels", default: nil },
      { name: "wl_bitrates", default: nil }
    ].each do |hwinfo_item|
      define_method hwinfo_item[:name].downcase do
        @hwinfo ? @hwinfo.fetch(hwinfo_item[:name], hwinfo_item[:default]) : hwinfo_item[:default]
      end
    end

    # @return [<String>] device name, @see dev_name
    alias_method :name, :dev_name

    def exists?
      !@hwinfo.nil?
    end

    # Device type description
    # FIXME: collision with alias for dev_name
    def description
      @hwinfo ? @hwinfo.fetch("name", "") : ""
    end

    # Returns the list of kernel modules
    #
    # The list of modules is internally represented as:
    #
    #   [[mod1name, mod1args], [mod2name, mod2args]]
    #
    # This method only returns the names, omitting the arguments.
    #
    # @return [Array<Driver>] List of drivers
    def drivers
      drivers_list = @hwinfo.fetch("drivers", [])
      modules = drivers_list[0].fetch("modules", [])
      modules.map { |m| Driver.new(*m) }
    end

  private

    def load_hwinfo(name)
      netcards = HardwareWrapper.new.ReadHardware("netcard")
      netcards.find { |h| h["dev_name"] == name }
    end
  end
end
