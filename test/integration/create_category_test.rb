require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(name: "admin", email: "admin@example.com", 
                              password: "password", admin: true)
    sign_in_as(@admin_user)
  end

  test "get new category form and create category" do
    get new_category_url
    assert_response :success
    assert_difference("Category.count", 1) do
      post categories_url, params: { category: { name: "Science" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Science", response.body
  end

  test "get new category form and reject invalid category submission" do
    get new_category_url
    assert_response :success
    assert_no_difference("Category.count") do
      post categories_url, params: { category: { name: "" } }
    end
    assert_match "errors", response.body
    assert_select "div.alert"
    assert_select "h5.alert-heading"
  end
end

