class User < ApplicationRecord
  has_many :reads, dependent: :destroy
  has_many :read_texts, through: :reads, source: :text

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :watcheds, dependent: :destroy
  has_many :watched_movies, through: :watcheds, source: :movie
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
