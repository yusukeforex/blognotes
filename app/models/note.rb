class Note < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { in: 2..50 }
  validates :description, presence: true, length: { in: 10..1000 }
  validates :user_id, presence: true
end
