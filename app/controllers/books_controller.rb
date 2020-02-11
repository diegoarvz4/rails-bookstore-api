class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  def index 
    @books = Book.all
    json_response(@books)
  end

  def show
    json_response(@book)
  end

  def create 
    @book = Book.new(book_params)
    if @book.save
      json_response(@book)
    end
  end

  def update
    @book.update_attributes(book_params)
    if @book.save
      json_response(@book)
    end
    head :no_content
  end

  def destroy
    @book.destroy
    head :no_content
  end

  private

    def book_params
      params.permit(:title, :category)
    end

    def set_book
      @book = Book.find_by(id: params[:id])
    end
end
