class Genre < ApplicationRecord
  validates :parameter, presence: true
  validates :title, presence: true

  # 読破済み進捗のパーセンテージを計算
  def self.percentage(completed_count, total_count)
    if total_count.zero?
      return 0
    else
      ( completed_count.to_f / total_count.to_f  * 100.0 ).to_i
    end
  end

  # 進捗管理のデータをビューで取り出しやすいように配列に加工
  def self.progress_data(user, type)
    counts = type.total_count
    completed_counts = type.completed_count(user)
    genres = Genre.all
    progress_data = {}

    genres.each do |genre|
      total_count = counts[genre.parameter] || 0
      completed_count = completed_counts[genre.parameter] || 0
      count = "#{completed_count}/#{total_count}"
      percentage = self.percentage(completed_count, total_count)

      progress_data.store(
        genre.parameter,
          {
            title: genre.title,
            color: genre.color,
            count: count,
            percentage: percentage
        }
      )
    end
    return progress_data
  end
end
