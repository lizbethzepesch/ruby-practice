class Step < ApplicationRecord
  belongs_to :techniques, optional: true
end
