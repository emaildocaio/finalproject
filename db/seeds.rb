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



puts "Starting creating users..."


  User.create(first_name: "Caio", last_name: "Farias",
              document: '613.961.590-96', phone: '(36) 26315-2842',
              address: 'Rua Visconde de Pirajá, 162, 201', email: 'emaildocaio@gmail.com',
              password: "123456")

  User.create(first_name: "Renata", last_name: "Grassi",
              document: '437.405.420-04', phone: '(48) 78637-1377',
              address: 'Ladeira do Russel, 233 ', email: 'renata@gmail.com',
              password: "123456")
  
  User.create(first_name: "Vinicius", last_name: "Morais",
              document: '056.033.980-19', phone: '(61) 15432-3256',
              address: 'Rua Vinte e Sete, 727 ', email: 'vinicius@gmail.com',
              password: "123456")

  User.create(first_name: "Patrick", last_name: "Khouri",
              document: '514.369.140-00', phone: '(70) 35247-8500',
              address: 'Travessa Santo Amaro, 15 ', email: 'patrick@gmail.com',
              password: "123456")

  User.create(first_name: "Patrick", last_name: "Khouri",
              document: '514.369.140-00', phone: '(70) 35247-8500',
              address: 'Travessa Santo Amaro, 15 ', email: 'patrick@gmail.com',
              password: "123456")
  
  User.create(first_name: "Milene", last_name: "Carodoso",
              document: '347.065.990-75', phone: '(54) 44453-9760',
              address: 'Rua Tajuri, 491 ', email: 'milene@gmail.com',
              password: "123456")
  
  User.create(first_name: "Maria", last_name: "Garcia",
              document: '744.016.650-74', phone: '(22) 51762-4727',
              address: 'Rua Antônio Vieira, 511 ', email: 'maria@gmail.com',
              password: "123456")

  User.create(first_name: "Thiago", last_name: "Ferraz",
              document: '800.659.340-08', phone: '(28) 89080-8806',
              address: 'Rua Artur Licio Pontual, 1080 ', email: 'thiago@gmail.com',
              password: "123456")

  User.create(first_name: "Jessica", last_name: "Zager",
              document: '313.321.830-18', phone: '(19) 34966-2371',
              address: 'Rua da Proclamação, 566 ', email: 'jessica@gmail.com',
              password: "123456")

  User.create(first_name: "Eduardo", last_name: "Vedder",
              document: '865.227.090-23', phone: '(89) 44973-4956',
              address: 'Rua José Joaquim Ferreira, 10 ', email: 'eduardo@gmail.com',
              password: "123456")
  
  User.create(first_name: "Berencice", last_name: "Mahe",
              document: '497.816.220-32', phone: '(81) 15329-5636',
              address: 'Rua Oswaldo Orlando da Costa, 60 ', email: 'berenice@gmail.com',
              password: "123456")

  User.create(first_name: "Saraah", last_name: "Bikai",
              document: '800.074.150-44', phone: '(15) 14336-4509',
              address: 'Beco Santa Fé, 111', email: 'saraah@gmail.com',
              password: "123456")
  
  User.create(first_name: "Bruno", last_name: "Talarico",
              document: '500.668.910-27', phone: '(29) 70565-7286',
              address: 'Rua Pacatuba, 867', email: 'bruno@gmail.com',
              password: "123456")
              
  User.create(first_name: "Bianca", last_name: "Ferreira",
              document: '890.371.580-21', phone: '(39) 26407-6367',
              address: 'Rua São Caetano, 89', email: 'bianca@gmail.com',
              password: "123456")

  User.create(first_name: "Andre", last_name: "Ferrer",
              document: '910.568.920-13', phone: '(14) 43504-0672',
              address: 'Rua Tomaz de Aquino, 210', email: 'andre@gmail.com',
              password: "123456")
  
  User.create(first_name: "Felipe", last_name: "Silva",
              document: '570.919.210-46', phone: '(60) 56264-7297',
              address: 'Rua Taborari, 782', email: 'Felipe@gmail.com',
              password: "123456")
  
  User.create(first_name: "Marina", last_name: "Pereira",
              document: '887.595.570-01', phone: '(26) 82542-6623',
              address: 'Rua Trinta e Um, 82', email: 'marina@gmail.com',
              password: "123456")


puts "#{User.count} users created!"

puts "Starting creating companies..."


  Company.create(cnpj: '50.260.485/0001-20', name: 'Elite Tour',
                 address:'Avenida Getúlio Vargas 19 Loja A, Arraial do Cabo', user: User.first )

  Company.create(cnpj: '01.543.166/0001-17', name: 'Arraial Boat',
                  address:'Rua Epitácio Pessoa 8, Arraial do Cabo', user: User.second )
  
  Company.create(cnpj: '89.270.616/0001-96', name: 'Turtle Dive',
                 address:'Rua Miguel Ângelo 3, Arraial do Cabo', user: User.third )

  Company.create(cnpj: '77.935.685/0001-92', name: 'Arraial Vip Tour',
                address:'Rua Santa Cruz 4, Arraial do Cabo', user: User.fourth )


puts "#{Company.count} companies created!"

puts "Starting creating products..."


p1 = Product.create(name: 'Day Trip to Pontal do Atalaia', price: 110,
  activity: "Day Trip", capacity: 50, status: true, company: Company.first, description: 'An amazing day trip to Pontal do Atalaia Beach, one of the most beautiful beaches in Brazil!')
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-17.jpg')
p1.photo.attach(io: file, filename: 'boat1.jpg')


p2 = Product.create(name: 'Forno Beach and Farol Beach Tour', price: 150,
activity: "Day Trip", capacity: 45, status: true, company: Company.first, description: 'Visit two amazing beaches in the city, we first arrive at Forno Beach and from there go to Farol Beacg.')
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-32.jpg')
p2.photo.attach(io: file, filename: 'boat2.jpg')


p3 = Product.create(name: 'Morning Dive', price: 250,
activity: "Dive", capacity: 15, status: true, company: Company.first, description: "Join us and dive in Brazil's best diving site.")
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-26.jpg')
p3.photo.attach(io: file, filename: 'boat3.jpg')


p4 = Product.create(name: 'VIP Tour - Book your private boat', price: 400,
activity: "Day Trip", capacity: 12, status: true, company: Company.second, description: "Book a full day exclusive boat tour, lunch included.")
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-15.jpeg')
p4.photo.attach(io: file, filename: 'boat4.jpg')


p5 = Product.create(name: 'Full day tour - Visit 3 beaches', price: 200,
activity: "Day Trip", capacity: 48, status: true, company: Company.second, description: "The perfect tour for who has limited time in Arraial, visit three amazing beaches in one full day boat experience.")
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/10/passeio-de-barco-em-arraial-do-cabo-praia-do-farol.jpg')
p5.photo.attach(io: file, filename: 'boat3.jpg')


p5 = Product.create(name: 'Night Dive', price: 230,
activity: "Dive", capacity: 18, status: true, company: Company.third, description: "Diving at night is an experience that every diver should have, come see lobsters, shrimps, octopuses and others with us.")
file = open('https://aqaba-diving.com/wp-content/uploads/2018/08/NightDive02.jpg')
p5.photo.attach(io: file, filename: 'boat5.jpg')


p6 = Product.create(name: 'Morning Dive', price: 230,
activity: "Dive", capacity: 18, status: true, company: Company.third, description: "Coming to arraial and diving is a must, best rated operator in the city.")
file = open('https://cdnstatic8.com/emalgumlugardomundo.com.br/wp-content/uploads/2019/05/mergulho-em-arraial-do-cabo-19.jpg')
p6.photo.attach(io: file, filename: 'boat6.jpg')


p7 = Product.create(name: 'All incusive party boat!', price: 300,
activity: "Day Trip", capacity: 41, status: true, company: Company.fourth, description: "The best party boat in Arraial, come visit beautifull beaches having Caipirinhas while meeting amazing people.")
file = open('https://media.tacdn.com/media/attractions-splice-spp-674x446/07/01/45/05.jpg')
p7.photo.attach(io: file, filename: 'boat7.jpg')

p8 = Product.create(name: 'Swim with turtles', price: 140,
activity: "Day Trip", capacity: 23, status: true, company: Company.fourth, description: "A day tour where we stop where there is a big flux of turtles.")
file = open('https://www.barbadospocketguide.com/images/stories/attractions/swimming-with-turtles/Swimming_With_Turtles.jpg')
p8.photo.attach(io: file, filename: 'boat8.jpg')

puts "#{Product.count} products created!"


# puts "#{Product.count} products created!"


puts "Creating customized shopping carts"

sc1 = ShoppingCart.create(voucher: "0001", status: "pago", user_id: User.all[-1].id)
sc2 = ShoppingCart.create(voucher: "0002", status: "pago", user_id: User.all[-2].id)
sc3 = ShoppingCart.create(voucher: "0003", status: "pago", user_id: User.all[-3].id)
sc4 = ShoppingCart.create(voucher: "0004", status: "pago", user_id: User.all[-4].id)
sc5 = ShoppingCart.create(voucher: "0005", status: "pago", user_id: User.all[-5].id)
sc6 = ShoppingCart.create(voucher: "0006", status: "pago", user_id: User.all[-6].id)
sc7 = ShoppingCart.create(voucher: "0007", status: "pago", user_id: User.all[-7].id)
sc8 = ShoppingCart.create(voucher: "0008", status: "pago", user_id: User.all[-8].id)
sc9 = ShoppingCart.create(voucher: "0009", status: "pago", user_id: User.all[-9].id)
sc10 = ShoppingCart.create(voucher: "0010", status: "pago", user_id: User.all[-10].id)
sc11 = ShoppingCart.create(voucher: "0011", status: "pago", user_id: User.all[-11].id)
sc12 = ShoppingCart.create(voucher: "0012", status: "pago", user_id: User.all[-12].id)
sc13 = ShoppingCart.create(voucher: "0013", status: "pago", user_id: User.all[-13].id)
sc14 = ShoppingCart.create(voucher: "0014", status: "pago", user_id: User.all[-14].id)
sc15 = ShoppingCart.create(voucher: "0015", status: "pago", user_id: User.all[-15].id)

puts "Customized shopping carts were created"

puts "Creating customized bookings"


# 18/09 - First tour
booking1 = Booking.create(shopping_cart: ShoppingCart.all[-15], product: Product.first,
date: "2020-09-18", participants: 4)
booking1.update(price: (booking1.product.price * booking1.participants)) # ok

booking4 = Booking.create(shopping_cart: ShoppingCart.all[-14], product: Product.first,
  date: "2020-09-18", participants: 12)
booking4.update(price: (booking4.product.price * booking4.participants)) # ok

# 18/09 - Second tour

booking8 = Booking.create(shopping_cart: ShoppingCart.all[-13], product: Product.second,
  date: "2020-09-18", participants: 5)
booking8.update(price: (booking8.product.price * booking8.participants)) # ok

booking38 = Booking.create(shopping_cart: ShoppingCart.all[-12], product: Product.second,
  date: "2020-09-18", participants: 23)
booking38.update(price: (booking38.product.price * booking38.participants)) # ok

# 18/09 - Third tour

booking9 = Booking.create(shopping_cart: ShoppingCart.all[-11], product: Product.third,
  date: "2020-09-18", participants: 4)
booking9.update(price: (booking9.product.price * booking9.participants)) # ok

# 19/09 - First tour - ok

booking10 = Booking.create(shopping_cart: ShoppingCart.all[-12], product: Product.first,
  date: "2020-09-19", participants: 23)
booking10.update(price: (booking10.product.price * booking10.participants))

booking11 = Booking.create(shopping_cart: ShoppingCart.all[-11], product: Product.first,
  date: "2020-09-19", participants: 4)
booking11.update(price: (booking11.product.price * booking11.participants))

booking12 = Booking.create(shopping_cart: ShoppingCart.all[-10], product: Product.first,
  date: "2020-09-19", participants: 14)
booking12.update(price: (booking12.product.price * booking12.participants))

# 19/09 - Second tour - ok

booking13 = Booking.create(shopping_cart: ShoppingCart.all[-15], product: Product.second,
  date: "2020-09-19", participants: 4)
booking13.update(price: (booking13.product.price * booking13.participants))

booking14 = Booking.create(shopping_cart: ShoppingCart.all[-10], product: Product.second,
  date: "2020-09-19", participants: 14)
booking14.update(price: (booking14.product.price * booking14.participants))

booking15 = Booking.create(shopping_cart: ShoppingCart.all[-9], product: Product.second,
  date: "2020-09-19", participants: 20)
booking15.update(price: (booking15.product.price * booking15.participants))

# 19/09 - Third  - ok

booking16 = Booking.create(shopping_cart: ShoppingCart.all[-10], product: Product.third,
  date: "2020-09-19", participants: 5)
booking16.update(price: (booking16.product.price * booking16.participants))

booking17 = Booking.create(shopping_cart: ShoppingCart.all[-9], product: Product.third,
  date: "2020-09-19", participants: 9)
booking17.update(price: (booking17.product.price * booking17.participants))

# 20/09 - First tour - ok

booking7 = Booking.create(shopping_cart: ShoppingCart.all[-13], product: Product.first,
  date: "2020-09-20", participants: 10)
booking7.update(price: (booking7.product.price * booking7.participants))

booking18 = Booking.create(shopping_cart: ShoppingCart.all[-9], product: Product.first,
  date: "2020-09-20", participants: 21)
booking18.update(price: (booking18.product.price * booking18.participants))

# 20/09 - Second tour - ok

booking5 = Booking.create(shopping_cart: ShoppingCart.all[-14], product: Product.second,
  date: "2020-09-20", participants: 12)
booking5.update(price: (booking5.product.price * booking5.participants))

# 20/09 - Third tour - ok

booking3 = Booking.create(shopping_cart: ShoppingCart.all[-15], product: Product.third,
  date: "2020-09-20", participants: 4)
booking3.update(price: (booking3.product.price * booking3.participants))

# 21/09 - First tour

booking6 = Booking.create(shopping_cart: ShoppingCart.all[-14], product: Product.first,
  date: "2020-09-21", participants: 12)
booking6.update(price: (booking6.product.price * booking6.participants))

# 21/09 - Second tour
# 21/09 - Third tour

# 22/09 - First tour
# 22/09 - Second tour
# 22/09 - Third tour

# 23/09 - First tour
# 23/09 - Second tour

booking19 = Booking.create(shopping_cart: ShoppingCart.all[-8], product: Product.second,
  date: "2020-09-23", participants: 7)
booking19.update(price: (booking19.product.price * booking19.participants))

# 23/09 - Third tour

# 24/09 - First tour - ok
booking20 = Booking.create(shopping_cart: ShoppingCart.all[-8], product: Product.first,
  date: "2020-09-24", participants: 7)
booking20.update(price: (booking20.product.price * booking20.participants))

booking21 = Booking.create(shopping_cart: ShoppingCart.all[-7], product: Product.first,
  date: "2020-09-24", participants: 13)
booking21.update(price: (booking21.product.price * booking21.participants))

# 24/09 - Second tour
# 24/09 - Third tour



# 25/09 - First tour
# 25/09 - Second - ok

booking22 = Booking.create(shopping_cart: ShoppingCart.all[-7], product: Product.second,
  date: "2020-09-25", participants: 13)
booking22.update(price: (booking22.product.price * booking22.participants))

# 25/09 - Third tour - ok

booking23 = Booking.create(shopping_cart: ShoppingCart.all[-8], product: Product.third,
  date: "2020-09-25", participants: 7)
booking23.update(price: (booking23.product.price * booking23.participants))

# 26/09 - First tour - ok

booking24 = Booking.create(shopping_cart: ShoppingCart.all[-6], product: Product.first,
  date: "2020-09-26", participants: 15)
booking24.update(price: (booking24.product.price * booking24.participants))

booking25 = Booking.create(shopping_cart: ShoppingCart.all[-5], product: Product.first,
  date: "2020-09-26", participants: 11)
booking25.update(price: (booking25.product.price * booking25.participants))

booking26 = Booking.create(shopping_cart: ShoppingCart.all[-4], product: Product.first,
  date: "2020-09-26", participants: 8)
booking26.update(price: (booking26.product.price * booking26.participants))

# 26/09 - Second tour - ok

booking27 = Booking.create(shopping_cart: ShoppingCart.all[-10], product: Product.second,
  date: "2020-09-26", participants: 5)
booking27.update(price: (booking27.product.price * booking27.participants))

booking28 = Booking.create(shopping_cart: ShoppingCart.all[-11], product: Product.second,
  date: "2020-09-26", participants: 12)
booking28.update(price: (booking28.product.price * booking28.participants))

booking29 = Booking.create(shopping_cart: ShoppingCart.all[-12], product: Product.second,
  date: "2020-09-26", participants: 23)
booking29.update(price: (booking29.product.price * booking29.participants))

# 26/09 - Third tour - ok

booking30 = Booking.create(shopping_cart: ShoppingCart.all[-7], product: Product.third,
  date: "2020-09-26", participants: 13)
booking30.update(price: (booking30.product.price * booking30.participants))

# 27/09 - First tour - ok

booking31 = Booking.create(shopping_cart: ShoppingCart.all[-3], product: Product.first,
  date: "2020-09-27", participants: 15)
booking31.update(price: (booking31.product.price * booking31.participants))

booking32 = Booking.create(shopping_cart: ShoppingCart.all[-2], product: Product.first,
  date: "2020-09-27", participants: 11)
booking32.update(price: (booking32.product.price * booking32.participants))

# 27/09 - Second tour - ok

booking33 = Booking.create(shopping_cart: ShoppingCart.all[-6], product: Product.second,
  date: "2020-09-27", participants: 15)
booking33.update(price: (booking33.product.price * booking33.participants))

booking34 = Booking.create(shopping_cart: ShoppingCart.all[-5], product: Product.second,
  date: "2020-09-27", participants: 11)
booking34.update(price: (booking34.product.price * booking34.participants))

booking35 = Booking.create(shopping_cart: ShoppingCart.all[-4], product: Product.second,
  date: "2020-09-27", participants: 8)
booking35.update(price: (booking35.product.price * booking35.participants))

booking36 = Booking.create(shopping_cart: ShoppingCart.all[-14], product: Product.second,
  date: "2020-09-27", participants: 12)
booking36.update(price: (booking36.product.price * booking36.participants))

# 27/09 - Third tour - ok

booking37 = Booking.create(shopping_cart: ShoppingCart.all[-7], product: Product.third,
  date: "2020-09-27", participants: 13)
booking37.update(price: (booking37.product.price * booking37.participants))

puts "Customized bookings were created"

puts "Creating Guests"


# booking1
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest2 = Guest.new(name: 'André', booking: Booking.all[0])
guest3 = Guest.new(name: 'Ana Cecília', booking: Booking.all[0])
guest4 = Guest.new(name: 'Heloísa', booking: Booking.all[0])

#booking2
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])
guest1 = Guest.new(name: 'Rodrigo', booking: Booking.all[0])


puts "Creating Guests were created!"
