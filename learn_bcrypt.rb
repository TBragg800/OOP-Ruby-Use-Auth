
# users = [
  #             {username: "Thomas", password: "password1"},
  #             {username: "Maria", password: "password2"},
  #             {username: "Little", password: "password3"},
  #             {username: "Cyrus", password: "password4"},
  # ]

module Crud

  require 'bcrypt'

  p "module crud activated"
    
  def create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  def verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  def create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end

  # new_users = create_secure_users(users)
  # puts new_users

  def authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
        return user_record
      end
    end
    "Credentials were not found"
  end

end

# puts authenticate_user("Little", "password3", new_users)
# puts authenticate_user("Cyrus", "password4", new_users)
