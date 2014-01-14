require 'pry'
require 'pry-debugger'
# require 'shelter_class.rb'
# require 'person_class.rb'
# require 'client_class.rb'


# Define Animal as a class


# Client_List = []

# Animal_list = []

happi_tails = Shelter.new()


dog = Animal.new("Dogue", 3, "male", "wolf")

bob = Client.new("bob", "no", 30, "no")


happi_tails.add_animal(dog)

# binding.pry

puts dog