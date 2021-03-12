class Movie < ApplicationRecord
  has_many :watcheds, dependent: :destroy
  validates :genre, presence: true
  validates :title, presence: true
  validates :url, presence: true

  def watched_by?(user)
    watcheds.find_by(user_id: user.id).present?
  end


  # ジャンル別の教材数を配列で取得
  def self.total_count
    self.group(:genre).count
  end

  # 視聴済みの教材数を配列で取得
  def self.completed_count(user)
    user.watched_movies.group(:genre).count
  end
end
