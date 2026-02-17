require "test_helper"

class ListCatgoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  end

  test "should show categories listing" do
    get categories_url
    assert_response :success
    assert_select "a[href=?]", category_path(@category)
    assert_select "a[href=?]", category_path(@category2)
    assert_match @category.name, response.body
    assert_match @category2.name, response.body
  end
end
