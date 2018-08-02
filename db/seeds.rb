# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

user = {}
user['password'] = '123'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['role'] = ["student","staff"].sample  
    user['point'] = [0,500,1700,5050,7500].sample

    User.create(user)
  end
end 

# Seed Listings
event = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  20.times do 
    event['title'] = Faker::App.name
    event['category'] = ["class", "presentation", "seminar", "sport", "other"].sample

    event['description'] = Faker::Hipster.sentence
    event['venue'] = Faker::University.name

    event['event_date'] = Faker::Date.forward(60)
    event['start_time'] = ["08:00","08:10", "08:20", "08:30", "08:40"].sample
    event['end_time'] = ["09:40","09:50", "10:00", "10:10", "10:30"].sample
     


    event['user_id'] = uids.sample

    Event.create(event)
  end
end