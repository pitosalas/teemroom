require 'test_helper'
require 'pry'

class AssessmentTest < ActiveSupport::TestCase
  describe "Just using user fixtures, no assessments:" do
    let(:u0) { users(:user0) }
    let(:u1) { users(:user1) }

    it "user has not given nor received assessments" do
      u0.given_assessments.length.must_equal 0
      u0.received_assessments.length.must_equal 0
    end
  end

  describe "Use both user and assessment fixtures" do
    let(:u1) { users(:user1) }
    let(:u2) { users(:user2) }

    let(:au11) { assessments(:au11) }
    let(:au12) { assessments(:au12) }

    it "correctly associates a0's users" do
      au11.assessor.must_equal u1
      au12.assessee.must_equal u2
    end
  end
end
