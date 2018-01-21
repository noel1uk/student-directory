# First get the width of the screen
require 'io/console'
# Create the array of possible cohorts
cohorts = ['January',
           'February',
           'March',
           'April',
           'May',
           'June',
           'July',
           'August',
           'September',
           'October',
           'November',
           'December']
# let's put all the students into an array
def input_students(cohorts)
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Now enter the students cohort"
  # Check and sort user input
  cohort = gets.chomp.downcase.capitalize
  while !cohorts.include?(cohort)
    puts 'You have entered an invalid cohort name. Enter the cohorts month'
    cohort = gets.chomp.downcase.capitalize
  end
  cohort = cohort.to_sym
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "\nNow we have #{students.count} students.
Enter the name of the next student"
    # get another name from the user
    name = gets.chomp
    if name == ''
      break
    end
    puts "Enter the students cohort"
    cohort = gets.chomp.downcase.capitalize
    while !cohorts.include?(cohort)
      puts 'You have entered an invalid cohort name. Enter the cohorts month'
      cohort = gets.chomp.downcase.capitalize
    end
    cohort = cohort.to_sym
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villains Academy".center(IO.console.winsize[1])
  puts "-------------".center(IO.console.winsize[1])
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(IO.console.winsize[1])
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students(cohorts)
print_header
print(students)
print_footer(students)
p students
