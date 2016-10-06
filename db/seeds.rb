# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.destroy_all
Post.destroy_all
Comment.destroy_all
Category.destroy_all
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Users
rosen = User.create(email:'Rosenroot@rosenroot.by', password: 'rosenroot', password_confirmation: 'rosenroot', confirmed_at: 1.days.ago)
potato= User.create(email:'Potato@gmail.com', password: 'potato', password_confirmation: 'potato', confirmed_at: 2.days.ago, created_at: 3.days.ago)
# Posts
post1 = Post.create(user_id: rosen.id, title: 'Puta', content: 'Te quero puta! Mass Mass Mass por favor. Mass Mass Mass si si senior')
post2 = Post.create(user_id: rosen.id, title: 'Home sweet home!', content: 'Home sweet home. It\'s the place where you can hide from your problems.')
post3 = Post.create(user_id: rosen.id, title: 'Java ensherinka', content: 'Ensherinka tryed to learn java, he understand something, but can understand all what he needed.')
post4 = Post.create(user_id: rosen.id, title: 'KFC Rat-ta-ta!', content: 'Rat was founded in KFC stipces, bon appetit!Te')
# Comments
Comment.create(user_id: rosen.id, post_id: post1.id, content: 'Beautyfull!')
Comment.create(user_id: potato.id, post_id: post1.id, content: 'Epic! Just epic!!!')
Comment.create(user_id: rosen.id, post_id: post2.id, content: 'Das ist mein teil...')
Comment.create(user_id: potato.id, post_id: post2.id, content: 'Epic! Just epic!!!')
Comment.create(user_id: potato.id, post_id: post2.id, content: '@#!@#@!#@!#@!#@!#@#@!@!#@!#')
Comment.create(user_id: rosen.id, post_id: post3.id, content: 'Unbelievable!')
Comment.create(user_id: potato.id, post_id: post3.id, content: 'Unbelievable!')
Comment.create(user_id: potato.id, post_id: post4.id, content: 'Unbelievable!')
Comment.create(user_id: potato.id, post_id: post4.id, content: 'Sh*t material. Unfollow!')

# Categories
Category.create(name: 'English')
Category.create(name: 'Programming')
Category.create(name: 'Food')
Category.create(name: 'Music')
Category.create(name: 'Sport')
Category.create(name: 'Games')
Category.create(name: 'Nature')
Category.create(name: 'PC')
