class User < ApplicationRecord
  attr_accessor :password_now
  mount_uploader :avatar, AvatarUploader
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_secure_password
  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

  def login?
    persisted?
  end
end
