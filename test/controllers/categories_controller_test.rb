require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "Jone", email: "jone@dsf.com", password: "pasdf", admin: true)
  end

  test "should get categories index page" do
    get :index
    assert_response :success
  end

  test "should get new page" do    
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "should get show page" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "sports2"}
    end
    assert_redirected_to categories_path
  end


end
