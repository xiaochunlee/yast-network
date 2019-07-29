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
require "forwardable"

module Y2Network
  # A container for connection configurations objects.
  #
  # @example Create a new collection
  #   eth0 = Y2Network::ConnectionConfig::Ethernet.new
  #   collection = Y2Network::ConnectionConfigsCollection.new([eth0])
  #
  # @example Find a connection config using its name
  #   config = collection.by_name("eth0") #=> #<Y2Network::ConnectionConfig::Ethernet:0x...>
  class ConnectionConfigsCollection
    extend Forwardable
    include Yast::Logger

    attr_reader :connection_configs
    alias_method :to_a, :connection_configs

    def_delegators :@connection_configs, :each, :push, :<<, :reject!, :map, :flat_map, :any?

    # Constructor
    #
    # @param connection_configs [Array<ConnectionConfig>] List of connection configurations
    def initialize(connection_configs = [])
      @connection_configs = connection_configs
    end

    # Returns a connection configuration with the given name if present
    #
    # @param name [String] Connection name
    # @return [ConnectionConfig::Base,nil] Connection config with the given name or nil if not found
    def by_name(name)
      connection_configs.find { |c| c.name == name }
    end
  end
end
