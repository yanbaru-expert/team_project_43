
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
    puts "TEXTへCSVデータ投入完了"
  end
end
