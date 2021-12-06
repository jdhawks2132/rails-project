# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
	Blog.create(title: Faker::Book.title, body: Faker::GreekPhilosophers.quote)
end

Language.create(title: 'Javascript', percent_used: 50)
Language.create(title: 'Ruby on Rails', percent_used: 30)
Language.create(title: 'SQL', percent_used: 10)
Language.create(title: 'HTML/CSS', percent_used: 10)

9.times do
	Portfolio.create(
		title: Faker::Lorem.word,
		subtitle: Faker::Lorem.sentence(word_count: 3),
		body: Faker::Lorem.paragraph(sentence_count: 2),
		main_image: 'https://placehold.co/600x400',
		thumb_image: 'https://placehold.co/350x200',
	)
end
