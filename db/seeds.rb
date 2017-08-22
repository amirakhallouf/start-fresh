# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  company = Company.new(name: Faker::Company.name, picture: Faker::Company.logo, email: Faker::Internet.email, password: "1234567")
  company.save
end
puts "Job Offers"
Company.all.each do |company|
  rand(5..10).times do
   company.job_offers.create(description: Faker::Hipster.paragraph, title: Faker::Job.title, location: Faker::Address.country, status: ["open", "closed"].sample )
  end
end

# JobOffer.all.each do |job_offer|
#   job_offer.create(description: Faker::Hipster.paragraph, title: Faker::Job.title, location: Faker::Address.country, status: [open, closed].sample )

# end



 10.times do
  user = User.new(name: Faker::Name.name, picture: Faker::Avatar.image, location: Faker::Address.country, skills: ["Web Developing","Design","Music Production"].sample, education: ["MA in Informatics", "BA in Design","Architecture"].sample, nationality: ["Greek","Chinese", "Japanese", "British"].sample, email: Faker::Internet.email, password: "1234567")
  user.save
end

JobOffer.all.each do |job_offer|
   users = User.order("RANDOM()").limit(rand(0..8))
   users.each do |user|
    user.job_applications.create(job_offer: job_offer, status: ["accepted", "rejected"].sample)
  end
end


