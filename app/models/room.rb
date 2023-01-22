class Room < ApplicationRecord
  belongs_to :user

  def self.areas
    { tokyo: "東京", osaka: "大阪"}
  end

  private
  def self.search_by_area(area)
    Room.where('address LIKE ?', '%' + Room.areas[area.to_sym] + '%')
  end

  def self.search_by_content(content)
    Room.where("name LIKE \'%#{content}%\' or detail LIKE \'%#{content}%\'")
  end
end
