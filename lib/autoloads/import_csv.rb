
class ImportCsv
  #csvデータのパスを引数で受け取り、インポート処理を実行
  def self.text_import(path)
    CSV.foreach(path, headers: true) do |row|
      Text.create!(
        genre: row["genre"],
        title: row["title"],
        content: row["content"]
      )
    end
    puts "テキスト教材のCSVデータ投入に成功しました。"
  end

  def self.movie_import(path)
    CSV.foreach(path, headers: true) do |row|
      Movie.create!(
        genre: row["genre"],
        title: row["title"],
        url: row["url"]
      )
    end
    puts "動画教材のCSVデータ投入に成功しました。"
 end
end
