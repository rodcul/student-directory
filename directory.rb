def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
	    puts "1. Input the students"
	    puts "2. Show the students"
	    puts "9. Exit"

    # 2. read the input and save it into a variable
    selection = gets.chomp
    
    # 3. do what the user has asked
	    case selection
	      when "1"
	        students = input_students
	      when "2"
	        print_header
	        print(students)
	        print_footer(students)
	      when "9"
	        exit # this will cause the program to terminate
	      else
	        puts "I don't know what you meant, try again"
	      end
	    end
end


def input_students
	puts "Please enter the names of students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	puts "Name"
	name = gets.delete "/\n/"
	return students if name.empty?
	puts "\nCohort"
	cohort = gets.delete "/\n/"
	cohort = "April" if cohort.empty?
	puts "\nCountry"
	country = gets.delete "/\n/"

	# while the name is not empty, repeat this code
while !name.empty? do
	#add the student hash to the array
	students << {:name => name, :cohort => cohort, :country => country}
	puts "Now we have #{students.length} #{students == 1 ? "student" : "students"}"
	# get another name from the user
	puts "Name"
	name = gets.delete "/\n/"
	return students if name.empty?
	puts "\nCohort"
	cohort = gets.delete "/\n/"
	cohort = "April" if cohort.empty?
	puts "\nCountry"
	country = gets.delete "/\n/"
end

#return the array of students
students
end


def print_header
  puts "The students of my cohort at Makers Academy"
  puts "".center(50,"-")
end

def print(students)
	return puts "No students at this time" if students.empty?
  	students.map do |student|
    	puts "#{student[:name]} (#{student[:cohort]} cohort from #{student[:country]})"
  end
end

def print_footer(names)
  puts "\nOverall, we have #{names.length} great students"
end 

#nothing happens until we call the methods
interactive_menu