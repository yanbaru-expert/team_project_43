class Genre < ApplicationRecord
  validates :parameter, presence: true
  validates :title, presence: true
end
