attributes = {
  email: "ruddnovskiy@gmail.com",
  password: "password123",
  password_confirmation: "password123",
}

User.find_or_create_by(attributes)