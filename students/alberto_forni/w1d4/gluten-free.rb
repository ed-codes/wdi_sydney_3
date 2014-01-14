# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

class AllergyError < StandardError
end

class Person
	attr_accessor :stomach, :allergies

	def initialize(allergies = [])
		@stomach = []
		@allergies = allergies
	end

	def can_eat?(food)
		allerg_to = allergies & food
		allerg_to.size == 0
	end

	def eat(food)
    begin
  		if can_eat?(food)
  			@stomach += food 
  		else
        @stomach = []
        raise AllergyError
      end
    rescue
      puts "You can't eat that food"
    end
	end
end

# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

chris = Person.new(["gluten"])
chris.eat(pizza)
chris.eat(pan_seared_scallops)
chris.eat(water)

p chris

beth = Person.new(["scallops"])
beth.eat(pizza)
beth.eat(pan_seared_scallops)
beth.eat(water)

p beth

# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError


# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exceptoin