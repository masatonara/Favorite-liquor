class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :liquors
  has_many :restaurants
  has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
  attachment :image_id, destroy: false
       
  
end
