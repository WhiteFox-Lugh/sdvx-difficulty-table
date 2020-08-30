# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

"""
CSV.foreach('db/data/lv18.csv') do |row|
  Sdvx.create(:title => row[0], :composer => row[1], :level => row[2].to_i, :chain => row[3].to_i, :jacket_img_url => row[4], :version => row[5].to_i)
end

CSV.foreach('db/data/lv19.csv') do |row|
  Sdvx.create(:title => row[0], :composer => row[1], :level => row[2].to_i, :chain => row[3].to_i, :jacket_img_url => row[4], :version => row[5].to_i)
end
"""

CSV.foreach('db/data/lv20.csv') do |row|
  Sdvx.create(:title => row[0], :composer => row[1], :level => row[2].to_i, :chain => row[3].to_i, :jacket_img_url => row[4], :version => row[5].to_i)
end

CSV.foreach('db/data/achievement.csv') do |row|
  Achievement.create(:userid => row[0].to_i, :tuneid => row[1].to_i, :score => row[2].to_i, :medal => row[3].to_i)
end