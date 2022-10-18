class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 15 }, uniqueness: { case_sensitive: false }
  has_many :messages
  has_secure_password
  scope :custom_display_2, -> { where(user_id: 3) }
end
