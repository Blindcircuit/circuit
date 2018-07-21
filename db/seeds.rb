# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
#sample
# CSV.foreach(Rails.root.join('db', 'seed.csv'), {headers: true, encoding: "UTF-8"}) do |row|
#   Post.create! row.to_hash
# end

# 트랙정보 삽입
CSV.foreach(Rails.root.join('db', 'track.csv'), {headers: true, encoding: "UTF-8"}) do |row|
  Track.create! row.to_hash
end
# 자동차 정보 삽입
CSV.foreach(Rails.root.join('db', 'car.csv'), {headers: true, encoding: "UTF-8"}) do |row|
  Car.create! row.to_hash
end
# 기록정보 삽입
CSV.foreach(Rails.root.join('db', 'record.csv'), {headers: true, encoding: "UTF-8"}) do |row|
  Record.create! row.to_hash
end

#유저 정보삽입
5.times do |i|
User.create(
  name: "정선우#{i}",
  email: "#{i}@#{i}",
  nickname: "선우#{i}",
  password: 123123,
  password_confirmation: 123123,
  confirmed_at: Time.now() 
)
end



# require 'faker'
#
# 5.times do |i|
#   User.create(
#     name: Faker::LeagueOfLegends.champion,
#     email: "#{i+1}@#{i+1}",
#     password: 123123,
#     password_confirmation: 123123
#   )
# end
#
# 20.times do
#   Post.create(
#     title: Faker::Pokemon.name,
#     content: Faker::OnePiece.quote,
#     user_id: (1..5).to_a.sample
#   )
# end
#
# 10.times do
#   Comment.create(
#     content: "댓글",
#     user_id: (1..5).to_a.sample,
#     post_id: (1..10).to_a.sample
#   )
# end
