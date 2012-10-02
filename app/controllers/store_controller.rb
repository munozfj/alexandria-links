class StoreController < ApplicationController
  def index
    @books = Book.search(nil)
    @cart = current_cart
  end
end
