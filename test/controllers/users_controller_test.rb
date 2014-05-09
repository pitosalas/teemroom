require "test_helper"

describe UsersController do
  it "should get index" do
    get :index
    assert_response :redirect
  end

  it "should get show" do
    get :show, {:id => 1}
    assert_response :redirect
  end

end
