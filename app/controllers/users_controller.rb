class UsersController < ApplicationController
  before_action :correct_user, only:[:edit, :update]

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @books = Book.all
    @booknew = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @booknew = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @books = @user.books
    if @user == current_user
      render "edit"
    else
      redirect_to user_path
    end
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    if @user.save
      redirect_to user_path, notice: "You have updated user successfully."
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :title, :body, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to (user_path(current_user.id)) unless @user == current_user
  end
end
