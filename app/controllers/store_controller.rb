class StoreController < ApplicationController
  def index
    @books = Book.search(nil)
  end
end
