# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  email      :string(255)
#  pay_type   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type

  has_many :line_items, :dependent => :destroy
  belongs_to :user

  PAYMENT_TYPES = [ "Cash", "Check" , "Credit card" , "Purchase order" ]

  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def self.search(search)
    if search
      find(:all, 
            :conditions => ['user_id = ?', "#{search}"],
          :order => "id desc" )
    else
      find(:all,:order => "id desc")
    end
  end

end
