class Shelter

  attr_accessor :clients, :animals

  def initialize
    @clients = {}
    @animals = {}
  end

  def add_animal(animal)
      happi_tails.animals << animal
  end

  def display_animals
    animals.each {|a| puts a} #puts each animal
  end

  def display_clients
    clients.map {|key,client| client} # take just the clients from the clients hash
  end

  def adopt  
    animal = animals.delete(animal_name.to_sym) #delete from the animals hash
    client = client[client_name.to_sym] 
    client.pets << animal 
  end
end # end Shelter class