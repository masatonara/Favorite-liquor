class Genre < ApplicationRecord
  has_many :liquors

  def self.search_for(content, method)
    if method == 'perfect'
      Liquor.where(genre_name: content)
    elsif method == 'forward'
      Liquor.where('genre_name LIKE ?', content + '%')
    elsif method == 'backward'
      Liquor.where('genre_name LIKE ?', '%' + content)
    else
      Liquor.where('genre_name LIKE ?', '%' + content + '%')
    end
  end

end
