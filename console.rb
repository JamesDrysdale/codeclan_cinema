require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry' )


customer1 = Customer.new({ 'name' => 'Boaby', 'funds' => '30' })
customer2 = Customer.new({ 'name' => 'Mary', 'funds' => '120' })
customer3 = Customer.new({ 'name' => 'Schubert', 'funds' => '55' })

customer1.save()
customer1.save()
customer1.save()

film1 = Film.new({ 'title' => 'The Voynich Conspiracy', 'price' => '10' })








binding.pry
nil