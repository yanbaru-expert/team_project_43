class Genre < ApplicationRecord
  validates :parameter, presence: true
  validates :title, presence: true

  # 進捗管理のデータをビューで取り出しやすいように配列に加工
  def self.progress_data(user)
    counts = Text.total_count
    read_counts = Text.read_count(user)
    genres = Genre.all
    progress_data = {}

    genres.each do |genre|
      total_count = counts[genre.parameter] || 0
      read_count = read_counts[genre.parameter] || 0
      count = "#{read_count}/#{total_count}"
      percentage = Text.percentage(read_count, total_count)

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
