class Shelter
  attr_accessor :clients, :animals, :remove_animal

	def initialize
		@clients = []
		@animals = []
    @removed_animals = []
	end

  def remove_animal(animal_name)
    find_animal = Proc.new { |animal| animal.name == animal_name }

    @removed_animals += @animals.select(&find_animal)
    @animals.reject!(&find_animal)
  end

  def add_animal(animal_name)
    find_animal = Proc.new { |animal| animal.name == animal_name }

    @animals += @removed_animals.select(&find_animal)
    @removed_animals.reject!(&find_animal)
  end

  def to_s
    string = "In the shelder there are:\n"
    @animals.each { |animal| string << animal << "\n" }
    string << "and the following clients:\n"
    @clients.each { |client| string << client << "\n" }

    string
  end
end