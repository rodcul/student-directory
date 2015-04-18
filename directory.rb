require 'csv'


@students = [] # an empty array accessible to all methods

def interactive_menu

  loop do
    # 1. print the menu and ask the user what to do
	print_menu   

    # 2. read the input and save it into a variable
    process(STDIN.gets.chomp)
    
    # 3. do what the user has asked
	end
	   
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the students from students.csv"
	puts "9. Exit"

end

def process(selection)
	 case selection
	      when "1"
	        input_students
	      when "2"
	        show_students
	      when "3"
	    	save_students
	      when "4"
	      	load_students
	      when "9"
	        exit # this will cause the program to terminate
	      else
	        puts "I don't know what you meant, try again"
	      end
end
	


def show_students
	print_header
	print_students_list
	print_footer
end

def student_questions
	puts "Name"
	@name = STDIN.gets.delete "/\n/"
	return @students if @name.empty?
	puts "\nCohort"
	@cohort = STDIN.gets.delete "/\n/"
	@cohort = "April" if @cohort.empty?
	puts "\nCountry"
	@country = STDIN.gets.delete "/\n/"
end

def input_students
	puts "Please enter the names of students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	student_questions

	# while the name is not empty, repeat this code
while !@name.empty? do
	#add the student hash to the array
	@students << {:name => @name, :cohort => @cohort, :country => @country}
	puts "Now we have #{@students.length} #{@students == 1 ? "student" : "students"}"
	# get another name from the user
	student_questions
end





#return the array of students
@students
end

def save_students
	CSV.open("students.csv", "wb") do |csv|
    	@students.map do |row|
    		csv << [row[:name],row[:cohort],row[:country]]
    	end  
  	end	
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? #get out of the method if no filename was provided
	if File.exists?(filename) #if it exists
		load_students(filename)
		puts "Loaded #{@students}.length from #{filename}"
	else #if it doesn't exist
		puts "Sorry, #{filename} doesn't exist."
		exit # quit the program
	end
end





def load_students(filename="students.csv")
	CSV.foreach("students.csv") do |row|
    @students << {:name => row[0], :cohort => row[1], :country => row[2]}
  end
	
end


def print_header
  puts "The students of my cohort at Makers Academy"
  puts "".center(50,"-")
end

def print_students_list
	return puts "No students at this time" if @students.empty?
  	@students.map do |student|
    	puts "#{student[:name]} (#{student[:cohort]} cohort from #{student[:country]})"
  end
end

def print_footer
  puts "\nOverall, we have #{@students.length} great students"
end 

#nothing happens until we call the methods

try_load_students
interactive_menu