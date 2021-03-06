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

require_relative "../../../test_helper"

require "y2network/sysconfig/connection_config_writers/vlan"
require "y2network/startmode"
require "y2network/boot_protocol"
require "y2network/connection_config/vlan"
require "y2network/connection_config/ip_config"

describe Y2Network::Sysconfig::ConnectionConfigWriters::Vlan do
  subject(:handler) { described_class.new(file) }

  let(:conn) do
    Y2Network::ConnectionConfig::Vlan.new.tap do |c|
      c.name = "eth0.100"
      c.interface = "eth0.100"
      c.description = ""
      c.parent_device = "eth0"
      c.vlan_id = 100
      c.startmode = Y2Network::Startmode.create("auto")
      c.bootproto = Y2Network::BootProtocol::DHCP
    end
  end

  let(:file) { Y2Network::Sysconfig::InterfaceFile.new(conn.name) }

  describe "#write" do
    it "writes the 'etherdevice' and the 'vlan_id' attributes" do
      handler.write(conn)
      expect(file).to have_attributes(
        etherdevice: "eth0",
        vlan_id:     100
      )
    end
  end
end
