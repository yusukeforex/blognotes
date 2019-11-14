class Note < ApplicationRecord
  belongs_to :user
  has_many :note_categories
  has_many :categories, through: :note_categories

  validates :title, presence: true, length: { in: 2..50 }
  validates :description, presence: true, length: { in: 10..1000 }
  validates :user_id, presence: true
end
