class Text < ApplicationRecord
  has_many :reads, dependent: :destroy
  validates :genre, presence: true
  validates :title, presence: true
  validates :content, presence: true

  def read_by?(user)
    reads.find_by(user_id: user.id).present?
  end

  # ジャンル別のデータ数を配列で取得
  def self.total_count
    self.group(:genre).count
  end

  # 読破済みの数を配列で取得
  def self.read_count(user)
    user.read_texts.group(:genre).count
  end

  # 読破済み進捗のパーセンテージ
  def self.percentage(read_count, total_count)
    if total_count.zero?
      return 0
    else
      ( read_count.to_f / total_count.to_f  * 100.0 ).to_i
    end
  end
end