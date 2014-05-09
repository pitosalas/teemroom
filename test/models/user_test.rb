require 'test_helper'
require 'pry'

class UserTest < ActiveSupport::TestCase

  describe User do
    it "detects when assessments are completed" do
      users(:user1).assessments_complete?.must_equal true
    end
    it "detects when assessments are incomplete" do
      users(:user2).assessments_complete?.must_equal false
    end
    it "knows the number of assessments for user1" do
      users(:user1).valid_assessments_count.must_equal 10
    end
    it "knows the number of assessments for user2" do
      users(:user2).given_assessments.count.must_equal 5
    end

    it "knows that user1 had a self assessment" do
      users(:user1).self_assessment?.must_equal true
    end

    it "knows that user3 did not have a self assessment" do
      users(:user3).self_assessment?.must_equal false
    end
  end
end
