require './console'

class Animal
  attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name = nil, age = nil, gender = nil, species = nil)
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = []
    create() unless name
	end

  def create()
    @name = Console.prompt 'What\'s the animal name?'
    @age = Console.prompt "How old is #{name}?"
    @gender = Console.prompt "What's #{name}'s gender?"
    @species = Console.prompt "What's #{name}'s species?"
    has_toys = Console.prompt "Does #{name} have any toys? (y)es (n)o"
    while has_toys == "y"
      toy = Console.prompt "Enter a toy"
      @toys << toy
      has_toys = Console.prompt "Does #{name} have another toy? (y)es (n)o"
    end
    Console.sn
  end

	def to_s
    "#{name} is a #{age} years old #{gender} #{species} that loves #{@toys.join(", ")}"
  end
end