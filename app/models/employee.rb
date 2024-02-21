class Employee < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: true}, length: {maximum:105}, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true
  validates :name, presence: true
  has_many :statuses
end
