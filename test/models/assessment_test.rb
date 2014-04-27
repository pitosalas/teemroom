require 'test_helper'
require 'pry'

class AssessmentTest < ActiveSupport::TestCase
  describe "Just using user fixtures, no assessments:" do
    let(:u0) { users(:user0) }
    let(:u1) { users(:user1) }

    it "user has not given nor received assessments" do
      u1.given_assessments.length.must_equal 0
      u1.received_assessments.length.must_equal 0
    end
  end

  describe "Use both user and assessment fixtures" do
    let(:u0) { users(:user0) }
    let(:u1) { users(:user1) }

    let(:a0) { assessments(:a0) }
    let(:a1) { assessments(:a1) }

    it "correctly associates a0's users" do
      a0.assessor.must_equal u0
      a0.assessee.must_equal u0
    end
  end
end
