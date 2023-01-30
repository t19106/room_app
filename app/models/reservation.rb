class Reservation < ApplicationRecord
  belongs_to :user
  validates :checkin, :checkout, :guest, presence: true
  validate :checkin_is_equal_or_later

  def checkin_is_equal_or_later
    return if checkin.nil? || checkout.nil?
    if checkin >= checkout
      errors.add(:checkin, "がチェックアウトと同日か、それより後の日付になっています。")
    end
  end
end
