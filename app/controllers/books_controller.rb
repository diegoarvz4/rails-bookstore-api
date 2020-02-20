class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    @books = Book.all
    render json: @books, except: [:created_at, :updated_at], status: :ok
  end

  def show
    render json: @book, except: [:created_at, :updated_at], status: :ok
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
      render json: @book, only: [:id, :title, :category], status: :ok 
    end
  end

  def destroy
    @book.destroy
    render json: { message: 'Succesfull deletion' }, status: :ok
  end

  private

    def book_params
      params.require(:book).permit(:title, :category)
    end

    def set_book
      # We want to run an exception. That is way find instead of find_by
      @book = Book.find(params[:id])
    end
end
