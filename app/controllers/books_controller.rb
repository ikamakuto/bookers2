class BooksController < ApplicationController
  def index
    @user = current_user
    @book = book.new
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def new
  end

  def edit
  end
end
