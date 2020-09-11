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

             
Club.create([{ id: 'caafb44d-3d86-4375-b597-4673409efe5a', name: 'Team 1' },
             { id: '2e5666c9-7c0a-41ce-94a2-1a1dd0dccf36', name: 'Team 2' },
             { id: '7abb1bfd-3b84-480a-bbf1-9b6619092521', name: 'Team 3' },
             { id: '2bf6d5b7-556f-433a-88b5-6a32d41656b6', name: 'Team 4' }])
              
Follow.create([{follower_id: '0e325d4a-46f4-48b4-8b5f-b55048fdfdfc', follower_type: 'User', followed_id: '62143047-e71f-4dbc-a917-5a8fd588ee9a', followed_type: 'User'},
               {follower_id: '0e325d4a-46f4-48b4-8b5f-b55048fdfdfc', follower_type: 'User', followed_id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af', followed_type: 'User'},
               {follower_id: '444cf3a3-b54f-4b3c-93fb-5d2a1cf13fe2', follower_type: 'User', followed_id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af', followed_type: 'User'},
               {follower_id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af', follower_type: 'User', followed_id: '444cf3a3-b54f-4b3c-93fb-5d2a1cf13fe2', followed_type: 'User'},
               {follower_id: 'caafb44d-3d86-4375-b597-4673409efe5a', follower_type: 'Club', followed_id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af', followed_type: 'User'},
               {follower_id: '7abb1bfd-3b84-480a-bbf1-9b6619092521', follower_type: 'Club', followed_id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af', followed_type: 'User'},
               {follower_id: 'd2c71a50-ee22-43a1-b3e7-c8430aa9d3af', follower_type: 'User', followed_id: '2e5666c9-7c0a-41ce-94a2-1a1dd0dccf36', followed_type: 'Club'},
               {follower_id: '62143047-e71f-4dbc-a917-5a8fd588ee9a', follower_type: 'User', followed_id: '2bf6d5b7-556f-433a-88b5-6a32d41656b6', followed_type: 'Club'}])