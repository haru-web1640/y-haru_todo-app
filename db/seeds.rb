# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 既存のユーザーを取得
user = User.find_by(email: 'test@example.com')

if user
  # ダミーボードを5つ作成
  5.times do
    user.boards.create!(
      name: Faker::Lorem.sentence(word_count: 5),
      description: Faker::Lorem.sentence(word_count: 100)
    )
  end
  puts "Boards created and linked to user: #{user.email}"
else
  puts "User not found. Please ensure the user exists before running this seed."
end
