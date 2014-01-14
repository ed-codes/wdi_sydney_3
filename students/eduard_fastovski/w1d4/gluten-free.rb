# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

class Person
	attr_accessor :stomach, :allergies
	
	def initialize
		@stomach = []
	end

	def eat(food)
		@stomach.push(food)
		@stomach.flatten!
		puts "Ate #{food}"
	end
end


class AllergyError < StandardError	
end

chris = Person.new
chris.allergies = "gluten"

beth = Person.new
beth.allergies = "scallops"

puts "Feed Chris or Beth?"

selection = gets.chomp.downcase!


if selection == "chris"
	puts "Do you want to feed chris - pizza, pan seared scallops or water?"
	command = gets.chomp
	if command == "pizza"
		chris.eat(pizza)
	elsif command == "pan seared scallops"
		chris.eat(pan_seared_scallops)
	elsif command == "water"
		chris.eat(water)
	end

elsif selection == "beth"
	puts "Do you want to feed beth - pizza, pan seared scallops or water?"
	command = gets.chomp
	if command == "pizza"
		chris.eat(pizza)
	elsif command == "pan seared scallops"
		chris.eat(pan_seared_scallops)
	elsif command == "water"
		chris.eat(water)
	end

end


people = [chris, beth]

people.each do |person|             # THE PROBLEM IS IM STILL FEEDING Beth

	begin

		if person.stomach.include?(person.allergies) 
			raise AllergyError
		else
			puts "mmm tasty" 
		end

		rescue AllergyError	

		p AllergyError
		puts "Rescued the error"		

	end

end








# Create a Person named chris. chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods

# pizza = ["cheese", "gluten", "tomatoes"]
# pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
# water = ["h", "h", "o"]

# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError


# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exceptoin