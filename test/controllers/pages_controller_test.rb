require "test_helper"

describe PagesController do
  it "should return a not ready yet page" do
    get(:show, {'page_name' => "cancel"})
    assert_response :success
  end
end
