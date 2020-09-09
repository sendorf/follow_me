# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ id: '0e325d4a-46f4-48b4-8b5f-b55048fdfdfc', firstname: 'John', lastname: 'Smith' },
             { id: '0e325d4a-46f4-4frs-8b5f-b5504538fdfdfc', firstname: 'Johana', lastname: 'Smith' },
             { id: '3434a-46f4-48b4-8b5f-b55048fdfdfc', firstname: 'John', lastname: 'Doe' },
             { id: '45d4a-46f4-48b4-8b5f-bgf3253dfdfc', firstname: 'Jane', lastname: 'Doe' }])
