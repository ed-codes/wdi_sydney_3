require 'sinatra'
require 'sinatra/reloader' if development?
# require 'pry'
# require 'pry-debugger'

helpers do
  # get an array of the stations between 2 indexes
  def get_stations_in_between(start_index, end_index, stations)
    arr = []
    method_name = nil
    if start_index < end_index
      method_name = :upto
    elsif start_index > end_index
      method_name = :downto
    else
      return arr
    end

    start_index.send(method_name,end_index) { |station_index| arr << stations[station_index] }
    
    #remove the station from which you're getting in
    arr.shift
    arr
  end

  # get metro lines and return conjunctions
  def stations_conjunctions(*lines, conjunctions)  
    conjunctions.each do |station, line_changes|
      return station if lines.all? { |line| line.include? station }
    end
  end

  # calucluate the travel from a station to an other station
  def calculate_travel(start_line, start_station, end_line, end_station, stations, lines, conjunctions)
    if start_line == end_line
      # you don't need to change
      current_line_stops = stations[start_line]
      
      # find the index of the station in which you get in and in which you get out
      start_index = current_line_stops.index(start_station)
      end_index = current_line_stops.index(end_station)

      arr = get_stations_in_between(start_index, end_index, current_line_stops)
    else
      # you need to change

      start_line_stations = stations[start_line]
      end_line_stations = stations[end_line]

      # find the station in which you need to change train
      change_station = stations_conjunctions(start_line_stations, end_line_stations, conjunctions)

      return if change_station.nil?

      # find the index of the station in which you need to change train in the first and in the second line
      change_index_start_line = start_line_stations.index(change_station)
      change_index_end_line = end_line_stations.index(change_station)

      # find the index of the station in which you get in and in which you get out of the train
      start_index = start_line_stations.index(start_station)
      end_index = end_line_stations.index(end_station)

      arr = []

      # get the path from the first to the change station
      arr = get_stations_in_between(start_index, change_index_start_line, start_line_stations)

      # get the path from the change to the last station
      arr += get_stations_in_between(change_index_end_line, end_index, end_line_stations)
    end
    
    arr.unshift(start_station)
    arr.map do |station|
      if station == change_station
        [station]
      else
        station
      end
    end
  end
end

get '/' do
  lines = ["n", "l", "6"]
  @stations = {
    "n" => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
    "l" => ["8th", "6th", "Union Square", "3rd", "1st"],
    "6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
  }
  conjunctions = { "Union Square" => ["n", "l", "6"] }

  @travel = []
  if params[:start_station]
    @start_station = params[:start_station][2..-1]
    @end_station = params[:end_station][2..-1]
    @start_line = params[:start_station][0]
    @end_line = params[:end_station][0]

    @travel += calculate_travel(@start_line, @start_station, @end_line, @end_station, @stations, lines, conjunctions)
  end

  erb :index
end
