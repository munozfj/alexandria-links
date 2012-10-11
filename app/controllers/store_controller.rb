class StoreController < ApplicationController
  skip_before_filter :authorize 

  #Para pagina de Array
  require 'will_paginate/array' 

  def index
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else
      #@books = Book.search(nil)
      @search = Book.search(params[:search])
      @books  = @search.paginate :page=>params[:page], 
                        :order=>'created_at desc' , 
                        :per_page => 5
      @cart = current_cart
    end
  end

  def show
    @book = Book.find(params[:id])
    @cart = current_cart
  end

end
