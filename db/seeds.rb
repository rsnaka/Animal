# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by!(email: "test@example.com") do |user|
  user.password = "aaaaaaaa"
  user.name = "test user"
end

user.posts.find_or_create_by!(title: "test1", body: "test body1") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"no_image.jpg")
end

user.posts.find_or_create_by!(title: "test2", body: "test body2") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"no_image.jpg")
end

user.posts.find_or_create_by!(title: "test3", body: "test body3") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"no_image.jpg")
end
