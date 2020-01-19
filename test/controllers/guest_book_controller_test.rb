require 'test_helper'

class GuestBookControllerTest < ActionDispatch::IntegrationTest
  test "should get sign" do
    get guest_book_sign_url
    assert_response :success
  end

end
