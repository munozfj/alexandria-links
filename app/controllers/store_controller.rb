class StoreController < ApplicationController
  def index
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else
      @books = Book.search(nil)
      @cart = current_cart
    end
  end

end
