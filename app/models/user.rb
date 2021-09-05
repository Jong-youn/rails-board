class User < ApplicationRecord
  belongs_to :role
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname,  presence: true, 
                        uniqueness: true, 
                        length: { minimum: 3, maximum: 25 }
  
  validates :email, presence: true, 
                    uniqueness: true, 
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
