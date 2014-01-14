class Console

  # prompt
  def self.prompt(question)
    print "#{question} > "
    gets.chomp
  end

  # puts a greeting
  def self.greetings(app)
    self.clean
    puts "Welcome to #{app}"
    puts "----------\n"
  end

  # puts bye bye
  def self.bye()
    puts "\n----------"
    puts "Bye Bye"
    puts "----------\n"
  end

  # separetor
  def self.s
    puts "-" * 10
  end

  # separetor whit \n
  def self.sn
    puts "-" * 10
    puts "\n"
  end

  #clean
  def self.clean
    puts "\e[H\e[2J" #clean screen
  end
end