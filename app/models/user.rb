# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  address         :text
#  occupation      :string(255)
#  administrator   :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  birthday        :date
#

class User < ActiveRecord::Base
  
  attr_accessible :address, :administrator, :email, 
                  :name, :occupation, :birthday, 
                  :password, :password_confirmation

  has_secure_password

  has_many :orders

  before_save { |user| user.email = email.downcase }

  default_scope :order => "name"

  #Validaciones
  validates :name, presence: true, 
                   length: { maximum: 150 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, 
                       length: { minimum: 6 }

  validates :password_confirmation, presence: true

  after_destroy :ensure_an_admin_remains

  def self.search(search)
    if search
      find(:all, 
            :conditions => ['id = ?', "#{search}"],
          :order => "email asc" )
    else
      find(:all,:order => "email asc")
    end
  end

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end   

end
