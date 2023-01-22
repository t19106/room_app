class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_secure_password

  def login?
    persisted?
  end
end
