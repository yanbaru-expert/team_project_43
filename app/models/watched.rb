class Watched < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user_id, uniqueness: { scope: :movie_id }
  def watched_by?(user)
    watcheds.find_by(user_id: user.id).present?
  end
end
