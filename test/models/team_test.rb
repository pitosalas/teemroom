require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  describe Team do
    it "always has a team 1" do
      Team.count.must_be(:>, 0)
    end
  end
end
