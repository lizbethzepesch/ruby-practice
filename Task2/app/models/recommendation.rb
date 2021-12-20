class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :coach
  belongs_to :technique

  enum status: [:recommended, :in_progress, :compeleted], _prefix: :status
end
