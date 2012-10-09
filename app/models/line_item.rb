# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#  order_id   :integer
#

class LineItem < ActiveRecord::Base
  attr_accessible :book_id, :cart_id

  belongs_to :book
  belongs_to :cart
  belongs_to :order


  def total_price
    book.price * quantity
  end
end
