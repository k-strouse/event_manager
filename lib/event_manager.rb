require "csv"								#tell ruby that we want it to load the csv library
puts "EventManager Initialized!"

#contents = File.read "event_attendees.csv"
#puts contents

#lines = File.readlines "event_attendees.csv"		#read the file and convert into an array of lines
#lines.each_with_index { |line, index| 
	#next if index == 0											#skip the first line of the array (which has the header row)
	#columns = line.split(",")							#split the rows of data into columns and put into columns array(each array index is a column)
	#name = columns[2]											#access the 'fist_Name' attribute in our array of columns
	#puts name
#}

#def clean_zipcode(zipcode)							#method for cleaning up the zip code
	#if zipcode.nil?												#if zipcode is blank then fill in with zero's
		#	"00000"
		#elsif zipcode.length < 5							#add a zero to the beginning of the zip code if length is less than 5 digits
			#zipcode.rjust(5, "0")
		#elsif zipcode.length > 5							#if zipcode length is over 5 digits then pick the first 5 digits
			#zipcode[0..4]
		#else
			#zipcode
	#end							
#end

def clean_zipcode(zipcode)								#A more idiomatic way to accomplish the same thing as the above method
	zipcode.to_s.rjust(5, "0")[0..4]
end





contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol #use CSV's open method to load file, add "header" parameter which states that the file has headers
contents.each { |row| 
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	puts "#{name} #{zipcode}"
}