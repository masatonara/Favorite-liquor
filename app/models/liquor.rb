class Liquor < ApplicationRecord
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	attachment :liquor_image, destroy: false


	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	
	def self.search_for(content, method)
    if method == 'perfect'
      Liquor.where(name: content)
    elsif method == 'forward'
      Liquor.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Liquor.where('name LIKE ?', '%' + content)
    else
      Liquor.where('name LIKE ?', '%' + content + '%')
    end
  end

end
