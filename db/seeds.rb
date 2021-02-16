EMAIL = 'test@example.com'
PASSWORD = 'password'

User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts 'ユーザーの初期データインポートに成功しました。'
end

ADMIN_EMAIL = 'admin@example.com'
ADMIN_PASSWORD = 'password'

AdminUser.find_or_create_by!(email: ADMIN_EMAIL) do |admin_user|
  admin_user.password = ADMIN_PASSWORD
  admin_user.password_confirmation = ADMIN_PASSWORD
  puts '管理者の初期データインポートに成功しました。'
end


Text.destroy_all
ImportCsv.text_import("db/csv_data/text_data.csv")

Movie.destroy_all
ImportCsv.movie_import("db/csv_data/movie_data.csv")
