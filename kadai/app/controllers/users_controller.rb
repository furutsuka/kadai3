class UsersController < ApplicationController
before_action :authenticate_user!
    def index
      @users = User.all
    end
    
    def new 
    end

    def edit
      @user = User.find(params[:id])
    end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def create_book
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user.id)

  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end