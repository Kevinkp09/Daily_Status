class Task < ApplicationRecord
  has_one_attached :screenshot
  validates :screenshot, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  belongs_to :status
end
