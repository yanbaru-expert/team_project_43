class User < ApplicationRecord
  has_many :reads, dependent: :destroy
  has_many :read_texts, through: :reads, source: :text

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # 読破済みの数を配列で取得
  def genres_read_count
    self.read_texts.group(:genre).count
  end

  # 読破済み進捗のパーセンテージ
  def self.percentage(genre_read_count, genre_count)
    ( genre_read_count.to_f / genre_count.to_f  * 100.0 ).to_i
  end
end
