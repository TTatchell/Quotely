# frozen_string_literal: true

# Model for user
class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :quotes, dependent: :destroy

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :authors, through: :likes, source: :users

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.create_from_omniauth(auth, auth_info)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.first_name = auth_info['first_name']
      u.last_name = auth_info['last_name']
      u.email = auth_info['email']
      u.password = SecureRandom.hex(16)
    end
  end
end
