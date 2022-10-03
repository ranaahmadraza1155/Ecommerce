class Api::V1::BooksController < ApplicationController
  def index
    book = Book.all
    render json: book
  end

  def show
  end

  def create
  end
end
