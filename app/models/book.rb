# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  author           :string(255)
#  description      :text
#  price            :decimal(8, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :integer
#  pic_updated_at   :datetime
#

class Book < ActiveRecord::Base
  attr_accessible :author, :description, :price, :title, :pic

  has_attached_file :pic, 
    :styles => { :medium => "300x300>", 
                 :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => {
          :bucket            => ENV['AWS_BUCKET_ALEX'],
          :access_key_id     => ENV['AWS_ACCESS_KEY_ALEX'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY_ALEX']
                       },
    :path => "/:style/:id/:filename",
    :url  => ":s3_url" 

  
  #Validaciones
  validates :title, presence: true, 
                    length: { maximum: 200 },
                    uniqueness: { case_sensitive: false }

  validates :author, presence: true

  validates :description, presence: true

  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0.01 }

  validates :pic, presence: true


  def self.search(search)
    if search
      find(:all, 
            :conditions => ['lower(title) like lower(?) or lower(author) like lower(?) or lower(description) like lower(?) ', "%#{search}%" , "%#{search}%" , "%#{search}%"],
          :order => "lower(title) asc, author asc" )
    else
      find(:all,:order => "lower(title) asc, author asc")
    end
  end


end
