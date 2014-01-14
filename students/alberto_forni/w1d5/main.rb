require './console'
require './animal'
require './client'
require './shelter'
require './relationships'

class App

  def initialize
    @main_menu = {
      a: "a - Add Animal",
      b: "b - Add Client",
      c: "c - Display all Animals",
      d: "d - Display all Clients",
      e: "e - Adopt Animal",
      f: "f - Put Animal for adoption",
      g: "g - View adoped animals",
      q: "q - quit" 
    }

    shelter = Shelter.new
    shelter.animals << Animal.new("Charlie", 3, "male","cat")
    shelter.animals << Animal.new("Beth", 3, "female","cat")
    shelter.clients << Client.new("Tom", 1, 34, 1)
    shelter.clients << Client.new("Marge", 1, 30, 1)
    relations = Relationships.new

    Console.clean
    begin
      Console.s
      @main_menu.values.each { |menu_option| puts menu_option }
      Console.s
      choise = Console.prompt("What do you wanna do?")
      Console.s

      case choise
      when 'a'
        shelter.animals << Animal.new
        puts "#{shelter.animals.last.name} added to the shelder"
      when 'b'
        shelter.clients << Client.new
        puts "#{shelter.clients.last.name} added to the shelder"
      when 'c'
        shelter.animals.each { |animal| puts animal }
      when 'd'
        shelter.clients.each { |client| puts client }
      when 'e'
        clients = shelter.clients.map { |client| client.name }
        puts clients.join(", ")
        client = Console.prompt("Select the client from the above list")
        until clients.include?(client)
          Console.s
          puts "Wrong choise!"
          client = Console.prompt("Select the client from the above list")
          Console.s
          next
        end

        animals = shelter.animals.map { |animal| animal.name }
        puts animals.join(", ")
        animal = Console.prompt("Select the animal from the above list")
        until animals.include?(animal)
          Console.s
          puts "Error!"
          animal = Console.prompt("Select the animal from the above list")
          Console.s
        end

        relations.adopt(client, animal)
        shelter.remove_animal(animal)

      when 'f'
        clients = shelter.clients.map { |client| client.name }
        puts clients.join(", ")
        client = Console.prompt("Select the client from the above list")
        until clients.include?(client)
          Console.s
          puts "Error!"
          client = Console.prompt("Select the client from the above list")
          Console.s
        end

        puts relations.adoption[client].join(", ")
        animal_name = Console.prompt("Which animal do you wanna put up for adoption?")
        until relations.adoption[client].include?(animal)
          Console.s
          puts "Wrong choise!"
          animal_name = Console.prompt("Which animal do you wanna put up for adoption?")          
          Console.s
        end

        relations.put_for_adoption(client, animal)
        shelter.add_animal(animal)
      when 'g'
        puts relations
      when 'q'
        puts "Bye, bye"
      else
        Console.s
        puts "Wrong choise!"
        Console.s
      end

    end until choise == 'q'
  end
end

App.new