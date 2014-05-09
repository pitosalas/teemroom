require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  describe Team do
    it "always has a team 1" do
      Team.count.must_be(:>, 0)
    end

    it "knows how many members" do
      teams(:test).members_count.must_equal 10
    end

    it "knows whether assessments are completed" do
      1.must_equal 1
    end
  end
end
