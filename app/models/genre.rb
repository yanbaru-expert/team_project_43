class Genre < ApplicationRecord
  validates :parameter, presence: true
  validates :title, presence: true

  # 進捗のパーセンテージを計算
  def self.percentage(completed_count, total_count)
    if total_count.zero?
      0
    else
      ( completed_count * 100 / total_count )
    end
  end


  # 進捗管理データをビューで取り出しやすいようにハッシュに加工
  def self.progress_data(user, type)
    # TextモデルまたはMovieモデルから教材数の配列を呼び出し
    counts = type.total_count
    completed_counts = type.completed_count(user)

    genres = Genre.all
    progress_data = {}

    genres.each do |genre|

      # 教材数の配列からジャンル毎にデータを取り出して変数へ代入
      total_count = counts[genre.parameter] || 0
      completed_count = completed_counts[genre.parameter] || 0

      #ビューで表示する「(完了済み教材/教材数)」とパーセンテージを変数へ代入
      count = "#{completed_count}/#{total_count}"
      percentage = self.percentage(completed_count, total_count)

      # ビューで使うデータをハッシュに収納
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
