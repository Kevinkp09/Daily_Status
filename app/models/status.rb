class Status < ApplicationRecord
  validates :github_pr_link, presence: true
  belongs_to :user
  has_many :tasks
  has_many :remarks
end
