class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
    @user = User.new(user_params)
    if @user.save
         redirect_to  user_path(current_user.id)
    else
         render "users/sign_up"
    end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully!!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "error!!"
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def  ensure_current_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
