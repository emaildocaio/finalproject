require 'faker'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
ShoppingCart.destroy_all
Product.destroy_all
Company.destroy_all
User.destroy_all



# puts "Starting creating users..."

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
              document: %w(938.166.070-04 085.377.620-24 204.142.880-50 693.469.990-47
              589.247.960-97 179.850.920-21 245.784.060-08 400.757.280-10 146.037.620-03
              129.156.930-80).sample, phone: Faker::PhoneNumber.cell_phone,
              address: Faker::Address.full_address, email: Faker::Internet.email,
              password: "123456")
end

puts "#{User.count} users created!"

puts "Starting creating companies..."

10.times do
Company.create(cnpj: %w(50.260.485/0001-20 41.017.941/0001-15 15.433.887/0001-89
  56.139.931/0001-20 20.809.660/0001-25 42.077.071/0001-32).sample,
  name: Faker::Cannabis.brand, address: ["Rua Vera Cruz 56, Arraial do Cabo",
    "Rua Édna Teixeira de Mello Fialho 18, Arraial do Cabo", "Rua Gonçalves Dias 46, Arraial do Cabo",
    "Rua Cediel Gomes Marinho 49, Arraial do Cabo", "Rua Carlos Aguiar 2, Arraial do Cabo",
    "Rua Miguel Ângelo 3, Arraial do Cabo", "Rua Epitácio Pessoa 8, Arraial do Cabo",
    "Rua Santa Cruz 4, Arraial do Cabo", "Rua Santa Cruz 50, Arraial do Cabo",
    "Rua Gonçalves Dias 02, Arraial do Cabo"].sample , user: User.all.sample)
end

puts "#{Company.count} companies created!"

puts "Starting creating products..."


p1 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i,
  activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-17.jpg')
p1.photo.attach(io: file, filename: 'boat1.jpg')


p2 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-15.jpeg')
p2.photo.attach(io: file, filename: 'boat2.jpg')


p3 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-praia-do-farol.jpg')
p3.photo.attach(io: file, filename: 'boat3.jpg')


p4 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-fenda-nossa-senhora.jpg')
p4.photo.attach(io: file, filename: 'boat4.jpg')


p5 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-pedra-do-macaco.jpg')
p5.photo.attach(io: file, filename: 'boat5.jpg')


p6 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-gruta-azul.jpg')
p6.photo.attach(io: file, filename: 'boat6.jpg')


p7 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-7.jpg')
p7.photo.attach(io: file, filename: 'boat7.jpg')


p8 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-praia-do-farol-2.jpg')
p8.photo.attach(io: file, filename: 'boat8.jpg')


p9 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-16.jpeg')
p9.photo.attach(io: file, filename: 'boat9.jpg')


p10 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-27.jpg')
p10.photo.attach(io: file, filename: 'boat10.jpg')


p11 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-22.jpg')
p11.photo.attach(io: file, filename: 'boat11.jpg')


p12 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-2.jpg')
p12.photo.attach(io: file, filename: 'boat12.jpg')


p13 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-26.jpg')
p13.photo.attach(io: file, filename: 'boat13.jpg')


p14 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-19.jpg')
p14.photo.attach(io: file, filename: 'boat14.jpg')


p15 = Product.create(name: Faker::Cannabis.strain, price: %w(60 65 70 80 95 100 110 240 250).sample.to_i, activity: ["Day Trip", "Dive"].sample, capacity: (60..110).to_a.sample, status: [true, false].sample, company: Company.all.sample, description: Faker::Lorem.sentence)
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-32.jpg')
p15.photo.attach(io: file, filename: 'boat15.jpg')


puts "#{Product.count} products created!"


#


# puts "#{Product.count} products created!"


puts "Creating Caio, Patrick, Vinicius e Renata"

User.create(first_name: "Caio", last_name: "Farias", document: "938.176.070-04", phone: "21 96521-0442", address: "Rua Cediel Goomes Marinho, 49", email: "emaildocaio@gmail.com", password: "123456")

User.create(first_name: "Patrick", last_name: "AlKhouri",
              document: "204.142.800-50", phone: "21 96521-0442",
              address: "Rua Cediel Goomes Marinho, 49", email: "patrick@gmail.com",
              password: "123456")

User.create(first_name: "Vinicius", last_name: "Carvalho",
              document: "693.479.990-47", phone: "21 96521-0442",
              address: "Rua Cediel Goomes Marinho, 49", email: "vinicius@gmail.com",
              password: "123456")

User.create(first_name: "Renata", last_name: "Grassi",
              document: "589.247.960-98", phone: "21 96521-0442",
              address: "Rua Cediel Goomes Marinho, 49", email: "renatagrassi@gmail.com",
              password: "123456")

puts "Team was created!"

puts "Creating customized Companies"

Company.create(cnpj: "50.260.125/0001-24", name: "BSF - Bigger, Stronger, Faster", address: "Rua Vera Cruz 56, Arraial do Cabo", user: User.all[-1])
Company.create(cnpj: "50.178.125/0001-23", name: "BSF - Bigger, Stronger, Faster", address: "Cediel Gomes Marinho, 45 Arraial do Cabo", user: User.all[-3])
Company.create(cnpj: "50.125.987/0001-22", name: "BSF - Bigger, Stronger, Faster", address: "Rua Vera Cruz 111, Arraial do Cabo", user: User.all[-2])
Company.create(cnpj: "35.876.114/0001-21", name: "BSF - Bigger, Stronger, Faster", address: "Rua Cediel Gomes Marinho 10, Arraial do Cabo", user: User.all[-4])

puts "Customized Companies were created"

puts "Creating customized products"

p16 = Product.create(name: "Lebron Haze", price: 80, activity: "Day Trip", capacity: 100, status: true, company: Company.all[-1], description: "Um passeio muito louco com aventuras incríveis pelo universo canábico uruguaio!")
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-17.jpg')
p16.photo.attach(io: file, filename: 'boat16.jpg')

p17 = Product.create(name: "Moby Dick XXl Auto", price: 80, activity: "Dive", capacity: 80, status: true, company: Company.all[-4], description: "Buy your seed em grown your own Barney's Farm bud")
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-26.jpg')
p17.photo.attach(io: file, filename: 'boat17.jpg')

puts "Customized products were created"

puts "Creating customized shopping carts"

sc1 = ShoppingCart.create(voucher: "0001", status: "pendente", user_id: User.all[-1].id)
sc2 = ShoppingCart.create(voucher: "0002", status: "pago", user_id: User.all[-2].id)
sc3 = ShoppingCart.create(voucher: "0003", status: "cancelado", user_id: User.all[-3].id)
sc4 = ShoppingCart.create(voucher: "0004", status: "pago", user_id: User.all[-4].id)

puts "Customized shopping carts were created"

puts "Creating customized bookings"


booking1 = Booking.create(shopping_cart: ShoppingCart.all[-4], product: Product.all[-1],
date: "2020-10-12", participants: 2)
booking1.update(price: (booking1.product.price * booking1.participants))

booking2 = Booking.create(shopping_cart: ShoppingCart.all[-3], product: Product.all[-2],
  date: "2020-10-12", participants: 1)
booking2.update(price: (booking2.product.price * booking2.participants))


booking3 = Booking.create(shopping_cart: ShoppingCart.all[-2], product: Product.all[-1],
  date: "2020-10-12", participants: 4)
booking3.update(price: (booking3.product.price * booking3.participants))


puts "Customized bookings were created"


