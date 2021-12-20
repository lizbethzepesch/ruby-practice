class UserNotification < ApplicationRecord
  belongs_to :user
  belongs_to :coach, optional: true
end
