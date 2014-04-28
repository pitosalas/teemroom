require "test_helper"

describe PagesController do
  it "should get not_ready_yet" do
    get :not_ready_yet
    assert_response :success
  end

  it "should get thank_you" do
    get :thank_you
    assert_response :success
  end

end
