class Text < ApplicationRecord
  has_many :reads, dependent: :destroy
  validates :genre, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
