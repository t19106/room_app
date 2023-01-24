class User < ApplicationRecord
  attr_accessor :password_now
  mount_uploader :avatar, AvatarUploader
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_secure_password

  def login?
    persisted?
  end
end
