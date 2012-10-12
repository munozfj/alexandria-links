class OrdersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]

  #Para pagina de Array
  require 'will_paginate/array' 

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.search(session[:user_id]).paginate :page=>params[:page], :order=>'id desc' , :per_page => 5
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @cart = current_cart

    if @cart.line_items.empty?
      redirect_to store_url, error: "Your cart is empty"
      return
    end

    @order = Order.new

    if session[:user_id] 
      if !User.find(session[:user_id]).administrator
        @order.name = User.find(session[:user_id]).name
        @order.email = User.find(session[:user_id]).email
        @order.address = User.find(session[:user_id]).address
      end
      @order.user_id=session[:user_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @cart = current_cart
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)

    if session[:user_id] 
      @order.user_id=session[:user_id]
    end

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        Notifier.order_received(@order).deliver
        format.html { redirect_to store_url, :notice => I18n.t('.thank_ur_order' ) }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        @cart = current_cart
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        @cart = current_cart
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
