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

require "forwardable"

module Y2Network
  # A container for network devices. In the end should carry methods for mass operations
  # over network interfaces like old LanItems::find_dhcp_ifaces or so.
  #
  # FIXME: Intended for LanItems::Items separation
  # proper cleanup is must
  class InterfacesCollection
    # FIXME: Direct access to be replaced to make possible
    # Y2Network::Config.interfaces.eth0
    # Y2Network::Config.interfaces.of_type(:eth)
    # ...
    attr_reader :old_items

    extend Forwardable

    def_delegators :@old_items, :each, :map, :select

    # @param interfaces [Array<Interface>] List of interfaces
    def initialize(interfaces)
      @old_items = interfaces
    end

    def find(name)
      old_items.find { |i| !i.name.nil? ? i.name == name : i.hardware.name }
    end

    def add(name)
      old_items.push(Interface.new(name))
    end
  end
end