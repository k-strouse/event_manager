puts "EventManager Initialized!"

#contents = File.read "event_attendees.csv"
#puts contents

lines = File.readlines "event_attendees.csv"		#read the file and convert into an array of lines
lines.each_with_index { |line, index| 
	next if index == 0										#skip the first line of the array (which has the header row)
	columns = line.split(",")							#split the rows of data into columns and put into columns array(each array index is a column)
	name = columns[2]											#access the 'fist_Name' attribute in our array of columns
	puts name
}