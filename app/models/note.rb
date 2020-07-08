class Note < ApplicationRecord
  belongs_to :user

  validates :title, :content, :user_id, presence: true

end