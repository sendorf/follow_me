# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ id: '0e325d4a-46f4-48b4-8b5f-b55048fdfdfc', firstname: 'John', lastname: 'Smith' },
             { id: '62143047-e71f-4dbc-a917-5a8fd588ee9a', firstname: 'Johana', lastname: 'Smith' },
             { id: '444cf3a3-b54f-4b3c-93fb-5d2a1cf13fe2', firstname: 'John', lastname: 'Doe' },
             { id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af', firstname: 'Jane', lastname: 'Doe' }])

Follow.create([{follower_id: '0e325d4a-46f4-48b4-8b5f-b55048fdfdfc', followed_id: '62143047-e71f-4dbc-a917-5a8fd588ee9a'},
               {follower_id: '0e325d4a-46f4-48b4-8b5f-b55048fdfdfc', followed_id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af'},
               {follower_id: '444cf3a3-b54f-4b3c-93fb-5d2a1cf13fe2', followed_id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af'},
               {follower_id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af', followed_id: '444cf3a3-b54f-4b3c-93fb-5d2a1cf13fe2'}])
