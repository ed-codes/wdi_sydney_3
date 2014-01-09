require 'pry'
require 'pry-debugger'

def hey_bob(something)

  if something.empty?
    return 'Fine. Be that way!'
  elsif something.upcase == something
    return 'Woah, chill out!'
  elsif something[-1] == '?'
    return 'sure'
  else
    return 'yeah whatever'
  end

end

binding.pry