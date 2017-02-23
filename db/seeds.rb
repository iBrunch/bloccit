# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'random_data'

# Create Posts
i = 0
50.times do
  if i == 0 || i%5 == 0
    Post.create!(
      title: "SPAM",
      body: RandomData.random_paragraph
    )
  else
    Post.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    )
  end
  i = i + 1
end

# Create Comments
  posts = Post.all
  100.times do
    Comment.create!(
      post: posts.sample,
      body: RandomData.random_paragraph
    )
end

puts "#{Post.count}"
Post.find_or_create_by(title: "Title", body: "Body text.")
puts "#{Post.count}"

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
