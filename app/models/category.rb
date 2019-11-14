class Category < ActiveRecord::Base
  has_many :note_categories
  has_many :notes, through: :note_categories
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 40 }
end

