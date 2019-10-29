class Note < ApplicationRecord
  validates :title, presence: true, length: { in: 2..50 }
  validates :description, presence: true, length: { in: 10..1000 }
end
