require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(users(:one))
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count", 1) do
      post users_url, params: { user: { firstname: "Ada", lastname: "Lovelace", username: "ada", password: "test-password" } }
    end
    assert_redirected_to users_url
    assert_equal "Ada", User.order(:id).last.firstname
  end

  test "should update user" do
    user = users(:one)
    patch user_url(user), params: { user: { firstname: "Grace" } }
    assert_redirected_to users_url
    assert_equal "Grace", user.reload.firstname
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(users(:one))
    end
    assert_redirected_to users_url
  end
end
