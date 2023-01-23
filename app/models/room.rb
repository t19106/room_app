class Room < ApplicationRecord
  belongs_to :user

  def self.areas
    ["東京", "大阪", "京都", "札幌"]
  end

  private
  def self.search_by_area(area)
    Room.where('address LIKE ?', '%' + area + '%')
  end

  def self.search_by_content(content)
    Room.where("name LIKE \'%#{content}%\' or detail LIKE \'%#{content}%\'")
  end
end
