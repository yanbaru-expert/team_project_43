class Movie < ApplicationRecord
  has_many :watcheds, dependent: :destroy
  validates :genre, presence: true
  validates :title, presence: true
  validates :url, presence: true

  def watched_by?(user)
    watcheds.find_by(user_id: user.id).present?
  end
end
