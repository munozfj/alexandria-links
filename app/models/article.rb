class Article < ActiveRecord::Base
  attr_accessible :body, :published_at, :subject
end
