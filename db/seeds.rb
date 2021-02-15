EMAIL = 'test@example.com'
PASSWORD = 'password'

User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts 'ユーザーの初期データインポートに成功しました。'
end

Text.destroy_all
ImportCsv.text_import("db/csv_data/text_data.csv")

Movie.destroy_all
ImportCsv.movie_import("db/csv_data/movie_data.csv")

AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin_user|
  admin_user.password = 'password'
  admin_user.password_confirmation = 'password'
  puts '管理者の初期データインポートに成功しました。'
end
