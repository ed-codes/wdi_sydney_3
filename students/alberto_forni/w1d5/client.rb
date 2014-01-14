class Client
  attr_accessor :name, :age, :children_num, :pets_num

	def initialize(name = nil, age = nil, children_num = 0, pets_num = 0)
		@name = name
    @age = age
    @children_num = children_num
    @pets_num = pets_num
    create() unless name
	end

  def create()
    @name = Console.prompt 'What\'s the client name?'
    @age = Console.prompt "How old is #{name}?"
    @children_num = Console.prompt "How many childern has #{name}?"
    @pets_num = Console.prompt "How many pets has #{name}?"
    Console.sn
  end

  def to_s
    "#{name}, is #{age}, has #{children_num} children and #{pets_num} animals"
  end
end