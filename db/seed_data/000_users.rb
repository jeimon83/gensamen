# frozen_string_literal: true

puts '###### usuarios administradores'
admins_data = [
  { email: 'admin@gensamen.com.ar',       first_name: 'Admin',    last_name: 'Gensamen',      role: 'admin', password: '123qwe', phone: nil },
  { email: 'francisco@morelabs.com.ar',   first_name: 'Paco',     last_name: 'Moreno',     role: 'admin', password: '123qwe', phone: nil },
  { email: 'jorge@morelabs.com.ar',       first_name: 'Jorge',    last_name: 'Moreno',     role: 'admin', password: '123qwe', phone: nil },
  { email: 'jaimegarciamendez@gmail.com', first_name: 'Jaime',    last_name: 'G. Mendez',  role: 'admin', password: '123qwe', phone: nil },
  { email: 'ezebm191@gmail.com',          first_name: 'Ezequiel', last_name: 'Bustamante', role: 'admin', password: '123qwe', phone: nil }
]
admins_data.each do |user_data|
  puts "-> #{user_data[:email]}"
  User.create!(user_data)
end