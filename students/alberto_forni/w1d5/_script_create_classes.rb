require 'fileutils'

classes = %w(animal client Shelter Relationships)

classes.each do |class_name|
	filename = "#{class_name.downcase}.rb"
	
	next if File.exist?(filename)

	FileUtils.touch filename 
	
	begin
		target = File.open(filename, 'w')
		target.write("class #{class_name.capitalize}\n")
		target.write("\tdef initialize\n")
		target.write("\tend\n")
		target.write("end")
	ensure
		target.close()
	end
end