class Task < ApplicationRecord
  has_one_attached :screenshot
  belongs_to :status
end
