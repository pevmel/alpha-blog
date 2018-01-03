class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to user_path(@user)
    elsif
      render 'new'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    elsif
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by User have been deleted"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user=User.find(params[:id])
    end

    def require_same_user
      if current_user != @user
        flash[:danger] = "You can edit only your profile"
        redirect_to root_path
      end
    end

    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Only admin users can perform that action"
        redirect_to root_path
      end
    end
end
