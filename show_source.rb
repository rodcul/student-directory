# Create a file that reads and prints its own source code

file = File.open(__FILE__ , "r")
file.readlines.each {|line| puts line.chomp}
file.close

# end of script