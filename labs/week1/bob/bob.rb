require 'pry'
require 'pry-debugger'

def hey_bob(something)

  if something.empty?
    'Fine. Be that way!'
  elsif something.upcase == something
    'Woah, chill out!'
  elsif something[-1] == '?'
    'sure'
  else
    'yeah whatever'
  end

end


def alternate_case(word)
  prev_char = ''
  word = word.split('')
  word.each do |char|
    if !['a','e','i','o','u'].include?(prev_char) && prev_char != char.upcase && !prev_char.empty?
      char.upcase!
    end
    prev_char = char
  end
  word.join
end

binding.pry