class Liquor < ApplicationRecord
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	attachment :image, destroy: false


	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
