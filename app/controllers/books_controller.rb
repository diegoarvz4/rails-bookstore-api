class BooksController < ApplicationController


  def index 
    @books = Book.all
    json_response(@book)
  end

end
