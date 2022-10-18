class Message < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: 'User'
  validates :body, presence: true
  scope :custom_display, -> { order(:created_at).last(20) }
end
