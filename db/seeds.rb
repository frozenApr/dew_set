# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
3.times do |i|
  User.create!(nick_name: "test_#{i}", phone_number: "1345566778#{i}", gender: 1,  place: "hangzhou", password: "12345678", password_confirmation: "12345678")
end
