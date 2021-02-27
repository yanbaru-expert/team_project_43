class User < ApplicationRecord
  has_many :reads, dependent: :destroy

  # 読破済みのテキストを取得
  has_many :read_texts, through: :reads, source: :text

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def percentage(genre)
    self.read_texts.where(genre).count.to_f / Text.where(genre).count.to_f  * 100.0
  end
end
