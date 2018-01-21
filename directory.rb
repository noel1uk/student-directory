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
  if name == ''
    exit
  end
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
    if students.length < 2
      puts "\nNow we have #{students.count} student.
Enter the name of the next student"
    else
      puts "\nNow we have #{students.count} students.
Enter the name of the next student"
    end
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
  months = students.map { |student| student[:cohort] }
  months = months.uniq
  months.each do |month|
    puts "\n" + month.to_s.center(IO.console.winsize[1])
    students.each do |key, value|
      if month == key[:cohort]
        puts "#{key[:name]} (#{key[:cohort]} cohort)".center(IO.console.winsize[1])
      end
    end
  end
end
def print_footer(students)
  puts "\nOverall, we have #{students.count} great students\n"
end
def interactive_menu(cohorts)
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
      when "1"
        students = input_students(cohorts)
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
#nothing happens until we call the methods
# students = input_students(cohorts)
# print_header
# print(students)
# print_footer(students)
interactive_menu(cohorts)
