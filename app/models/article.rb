# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  subject      :string(255)
#  body         :text
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :body, :published_at, :subject

  default_scope :order => 'id'
end
