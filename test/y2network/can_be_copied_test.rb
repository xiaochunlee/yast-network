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

require_relative "../test_helper"

require "y2network/can_be_copied"

describe Y2Network::CanBeCopied do
  Dummy = Struct.new(:value) do
    include Y2Network::CanBeCopied
  end

  subject { Dummy.new("test") }

  describe "#copy" do
    it "returns an equivalent but different object" do
      other = subject.copy
      expect(subject.value).to eq(other.value)
      expect(subject).to_not be(other)
    end
  end
end
