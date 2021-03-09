class Text < ApplicationRecord
  has_many :reads, dependent: :destroy
  validates :genre, presence: true
  validates :title, presence: true
  validates :content, presence: true

  def read_by?(user)
    reads.find_by(user_id: user.id).present?
  end

  # ジャンル別の教材数を配列で取得
  def self.total_count
    self.group(:genre).count
  end

  # 読破済みの教材数を配列で取得
  def self.completed_count(user)
    user.read_texts.group(:genre).count
  end
end