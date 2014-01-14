require 'pry'
require 'pry-debugger'


subway = {}

subway['n'] = ["times square", "34th", "28th", "23rd", "union square", "8th"]
subway['l'] = ["8th", "6th", "union square", "3rd", "1st"]
subway['s'] = ["grand central", "33rd", "28th", "23rd", "union square", "Astor Place"]


puts "Which train are you getting on? n, l s?"
	@line_on = gets.chomp

puts "Which stop are you getting on?"
	@stopon = gets.chomp    

puts "Which train are you getting off? n, l, s?"
	@line_off = gets.chomp

puts "Which stop are you getting off?"
	@stopoff = gets.chomp

#find the index of where they got on and where they got off - returns - 
  index_on = (subway[@line_on].index(@stopon))
  index_off = (subway[@line_off].index(@stopoff))

  # binding.pry

  # define the index of union square on the line they got on
  unionin = subway[@line_on].index("union square")
  # the index of union square on the line they got off
  unionout = subway[@line_off].index("union square")


  if @line_on != @line_off # if the person is changing lines
    
    @numstops = (unionin - index_on).abs + (unionout - index_off).abs   # abs turns negatives into positives
    
    array_on = subway[@line_on]
    array_off = subway[@line_off] # the hash it should search through
    
    stops_covered = []

# THE FIRST HALF OF THE TRIP
    #If the index where they got on is smaller than the index of union square, count the stations up to union
    if index_on < unionin
      index_on.upto(unionin) { |stop| stops_covered<<(array_on[stop]) } # push each stop to the stops_covered array
    #If the index where they got on is higher than union square, list the stations down to union square
    elsif  index_on > unionin
      index_on.downto(unionin) { |stop| stops_covered<<(array_on[stop]) }
    end
# THE SECOND HALF OF THE TRIP
    if index_off > unionout
      unionout.upto(index_off) { |stop| stops_covered<<(array_off[stop]) }
    elsif  index_off < unionout
      unionout.downto(index_off) { |stop| stops_covered<<(array_off[stop]) }
    end

#if they are not changing lines
  else
    @numstops = index_off - index_on
    stops = subway[@line_on]
    stops_covered = stops[index_on..index_off]

  end

puts "It will take #{@numstops} stops"

p stops_covered

# n.each {|stop| counter += 1 				# how to puts the index of the stop as it counts through it?
# break if stop == "union square"
# }



					# use .uniq to not count union 

					# use .index to get the index position of stopon

