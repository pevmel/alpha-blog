require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "sports")
  end

  test "should get categories index page" do
    get :index
    assert_response :success
  end

  test "should get new page" do
    get :new
    assert_response :success
  end

  test "should get show page" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end


end
