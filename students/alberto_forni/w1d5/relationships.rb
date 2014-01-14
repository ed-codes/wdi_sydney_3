class Relationships
  attr_reader :adoption

	def initialize
    @adoption = {}
	end

  def adopt(client_name, animal_name)
    @adoption[client_name] ||= []
    @adoption[client_name] << animal_name
  end

  def put_for_adoption(client_name, animal_name)
    @adoption[client_name].reject! { |animal| animal == animal_name }

    puts @adoption[client_name].size

    @adoption.delete(client_name) if @adoption[client_name].size == 0
  end

  def to_s
    string = ""
    @adoption.each do |client, animal|
      string << "#{client} adopted #{animal.join(", ")}\n"
    end
    string
  end
end