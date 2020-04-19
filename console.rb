require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry' )

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({ 'name' => 'Boaby', 'funds' => '30' })
customer2 = Customer.new({ 'name' => 'Mary', 'funds' => '120' })
customer3 = Customer.new({ 'name' => 'Schubert', 'funds' => '55' })

customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({ 'title' => 'The Voynich Conspiracy', 'price' => '10' })
film2 = Film.new({ 'title' => 'Bob\'s Your Oyster', 'price' => '12' })
film3 = Film.new({ 'title' => 'Smashed, Out The Park', 'price' => '8' })

film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id })
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film3.id })

ticket1.save()
ticket2.save()
ticket3.save()



binding.pry
nil