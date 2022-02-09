class UsersController < ApplicationController
  #ログインしていない状態で、他のページに推移しようとした時、ログインページに推移する
  before_action :authenticate_user!
  #ログインユーザー以外の情報を推移しようとした時に制限をかける
  before_action :ensure_current_user, {only: [:edit,:update,:destroy]}

  def create
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def new
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
        render "users/sign_up"
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
        flash[:notice] = "errors prohibited this abj from being saved:"
        render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_current_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
