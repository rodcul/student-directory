def input_students
	puts "Please enter the names of students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	puts "Name"
	name = gets.chomp
	puts "\nCohort"
	cohort = gets.chomp
	puts "\nCountry"
	country = gets.chomp

	# while the name is not empty, repeat this code
while !name.empty? do
	#add the student hash to the array
	students << {:name => name, :cohort => cohort, :country => country}
	puts "Now we have #{students.length} students"
	# get another name from the user
	puts "Name"
	name = gets.chomp
	return students if name.empty?
	puts "\nCohort"
	cohort = gets.chomp
	puts "\nCountry"
	country = gets.chomp
end

#return the array of students
students
end


def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index() do |student,index|
     puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort from #{student[:country]})"

  end
end

def print_footer(names)
  puts "\nOverall, we have #{names.length} great students"
end 


#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)