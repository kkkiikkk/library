email = 'ruddnovskiy@gmail.com'
attributes = {
  email: email,
  password: 'password', 
  password_confirmation: 'password'
}

AdminUser.find_or_create_by(attributes)
