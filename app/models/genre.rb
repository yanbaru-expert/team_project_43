class Genre < ApplicationRecord
  validates :title, presence: true
end
