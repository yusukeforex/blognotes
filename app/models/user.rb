class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_one_attached :image #should i delete this or not
  before_save { self.email = email.downcase }

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, confirmation: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }

  validates :email_confirmation, presence: true

  validates :password, presence: true, on: :create, confirmation: true, length: { in: 8..16 }

  validates :password_confirmation, presence: true, on: :create



end

