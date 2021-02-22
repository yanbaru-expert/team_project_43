class Movie < ApplicationRecord
  has_many :watcheds, dependent: :destroy
  validates :genre, presence: true
  validates :title, presence: true
  validates :url, presence: true
end
