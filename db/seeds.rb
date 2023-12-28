puts '*** Добавление гостя ***'
unless User.find_by(email: 'guest@example.com')
  User.create(
    email: 'guest@example.com',
    password: 'guest_user',
    password_confirmation: 'guest_user'
  )
end
