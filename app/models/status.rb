class Status < ApplicationRecord
  belongs_to :user
  has_many :tasks
  VALID_URL_REGEX = /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()!@:%_\+.~#?&\/\/=]*)/
  validates :github_pr_link, presence: true, format: { with: VALID_URL_REGEX }
end
