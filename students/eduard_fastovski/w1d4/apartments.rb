require 'pry'
require 'pry-debugger'



class Building 
	attr_accessor :address, :rooms, :size, :type, :name # :number_bedrooms, :number_bathrooms

	def initialize
		@address = ""
	end

	def to_s
		"Name - #{@name}. Address - #{@address}. Type - #{@type}. Size - #{@size}. Number of room - #{@rooms}"
	end

end


class Listing
	attr_accessor :price, :building, :picture, :description, :pets_allowed
	def initialize 
		@picture = []
	end
	def to_s
	"Price - #{@price}. \n Description - #{@description}. \n Pictures - #{@picture}. \n Pets are #{@pets_allowed}. \n Building information - #{@building}. "
	end

end

class Tenant
	attr_accessor :name, :contact_details, :budget, :pets_owned
	def to_s
		"Name - #{@name}. \n Contact Details - #{@contact_details}. \n Budget - #{@budget}. \n Pets Owned - #{@pets_owned}"
	end
end

#Some pre-made stuff for testing

#Pre-made building
fishburners = Building.new
fishburners.name = "fishburners"
fishburners.type = "office"
fishburners.address = "608 Harris St"
fishburners.rooms = "100"
fishburners.size = "500sqm"

#Pre-made listing
fishburners_listing = Listing.new
fishburners_listing.price = 2000000
fishburners_listing.pets_allowed = "not allowed"
fishburners_listing.description = "a place"
fishburners_listing.picture = []
fishburners_listing.building = fishburners


shack = Building.new
shack.name = "shack"
shack.type = "shack"
shack.address = "beach"
shack.rooms = "1"
shack.size = "2sqm"

shack_listing = Listing.new
shack_listing.price = 20
shack_listing.pets_allowed = "allowed"
shack_listing.description = "a crappy place"
shack_listing.picture = []
shack_listing.building = shack


# Pre made tenants for testing

bob = Tenant.new
bob.name = "bob"
bob.contact_details = 1352352349
bob.budget = 400
bob.pets_owned = :y

rob = Tenant.new
rob.name = "rob"
rob.contact_details = 16997857
rob.budget = 600
rob.pets_owned = :n


# the lists which the user can select from to view more info
tenant_list = [bob, rob]

listing_list = [fishburners_listing, shack_listing] 

# the main menu loop
loop do 
puts "Do you want Listings or Tenants? Or to create a new listing? (Listings/Tenants/Create)"
command = gets.chomp.downcase
break if command == 'q' #exit the program

if command == "create"
	puts "Enter Building name"
	buildingname = gets.chomp
    
	puts "What type of building?"
	btype = gets.chomp

	puts "Enter building address"
	baddress = gets.chomp

	puts "Enter number of rooms"
	brooms = gets.chomp

	puts "Enter size of building"
	bsize = gets.chomp

	puts "Enter Price"
	bprice = gets.chomp

	puts "Are pets allowed?"
	bpets = gets.chomp

	puts "Please write a description"
	bdesc = gets.chomp

	puts "pictures please"
	bpic = gets.chomp

	#user created building info
	bname = Building.new
	bname.name = buildingname
	bname.type = btype
	bname.address = baddress
	bname.rooms = brooms
	bname.size = bsize

	# user created listing
	bname_listing = Listing.new
	bname_listing.price = bprice
	bname_listing.pets_allowed = bpets
	bname_listing.description = bdesc
	bname_listing.picture = bpic
	bname_listing.building = bname

	#push the new user created listing to the listing_list array, to display for the user
	listing_list.push(bname_listing)

#display the tenant list
elsif command == "tenants"
	puts tenant_list.map {|tenant| tenant.name} # display only the name in the displayed list 
	puts "Choose a building"
	selection = gets.chomp
	if selection == "bob"
		puts bob
	elsif selection == "rob"
		puts rob
	end	

elsif command == "listings"
	puts listing_list.map {|listing| listing.building.name}
	puts "Choose a building"
	selection = gets.chomp

	selected_listing = listing_list.find {|listing| listing.building.name == selection }

	puts selected_listing
	# if selection == "fishburners"
	# 	puts fishburners_listing
	# elsif selection == "shack"
	# 	puts shack_listing
	# elsif selection == bname
	# 	puts bname_listing
	# end	

	# building = buildings.find {|name| name == selection }

 #    listing = Listing.new
 #    listing.building = building

end # end if

end # end loop

# puts "bob is #{bob}"



# list1 = Listing.new
# list1.address = "harris st"

# list1.to_s