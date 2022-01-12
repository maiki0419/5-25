class UsersController < ApplicationController
  def index
    @book = Book.new
    @user = User.find_by(id: current_user.id)
    @users = User.all
  end

  def show
   @book = Book.new
   @user = User.find_by(id: current_user.id)
   @books = @user.books
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
