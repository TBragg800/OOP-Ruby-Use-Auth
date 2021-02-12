require_relative "learn_bcrypt"

users = [
              {username: "Thomas", password: "password1"},
              {username: "Maria", password: "password2"},
              {username: "Little", password: "password3"},
              {username: "Cyrus", password: "password4"},
]

hashed_users = Crud.create_secure_users(users)
puts hashed_users