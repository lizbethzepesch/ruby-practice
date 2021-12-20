class Problem < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :coaches
  has_and_belongs_to_many :techniques
end
