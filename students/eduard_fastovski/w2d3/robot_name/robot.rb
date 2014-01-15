class Robot
  
  attr_accessor :name, :mac

  def name 
    #@name = @name || prefix + postfix
    @name ||= prefix + postfix
  end

  def reset
    puts "Resetting to factory settings."
    @name = nil
  end

  def prefix
    2.times.map { |letter| ("A".."Z").to_a.shuffle[letter] }.join
    # Another way is -  ("A".."Z").to_a.sample(2).join
  end

  def postfix
    (1 + rand(999)).to_s
  end

end


