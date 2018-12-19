# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# a = [1,2,3,4,5,6,7,8,9,10]
# b = [1,2,3,4,5,6,7,8,9,10]
# a.each do |n|
# b.each do |m|
# Cell.create({x:(m), y:(n)})
# end
# end
#
# a = [1,2,3]
# b = [1,2,3]
# a.each do |n|
# b.each do |m|
# Cell.create({x:(m), y:(n)})
# end
# end

Subscription.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

10.times do |index|
  Message.create!( content:Faker::PrincessBride.quote,
                    user_id: Faker::Number.between(1,3),
                    chat_id: Faker::Number.between(1,3))
end

p "Created #{Chat.count} chats"
p "Created #{Message.count} Messages"
