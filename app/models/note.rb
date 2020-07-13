class Note < ApplicationRecord
  belongs_to :user

  validates :title, :content, :user_id, presence: true
  has_one_attached :picture

end