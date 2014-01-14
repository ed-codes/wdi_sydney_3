class Person
  attr_accessor :name, :age, :gender, :num_kids
  
  def initialize(name, age, gender, num_kids)
    @name = name
    @age = age
    @gender = gender
    @num_kids = num_kids
    @pets = {}
  end

  def to_s
    "#{name} is a #{age} year old #{gender} with #{num_kids} kids and #{pets.size} pets"
  end

end # end Person class