class Liquor < ApplicationRecord
  belongs_to :user
  belongs_to :genre
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	attachment :liquor_image, destroy: false

  geocoded_by :address
  after_validation :geocode



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


  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 200 }
  validates :day, presence: true

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

end
