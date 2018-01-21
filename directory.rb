[0..-2]# First get the width of the screen
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
  name = gets[0..-2]
  puts "Now enter the students cohort"
  # Check and sort user input
  cohort = gets[0..-2].downcase.capitalize
  while !cohorts.include?(cohort)
    puts 'You have entered an invalid cohort name. Enter the cohorts month'
    cohort = gets[0..-2].downcase.capitalize
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
    name = gets[0..-2]
    if name == ''
      break
    end
    puts "Enter the students cohort"
    cohort = gets[0..-2].downcase.capitalize
    while !cohorts.include?(cohort)
      puts 'You have entered an invalid cohort name. Enter the cohorts month'
      cohort = gets[0..-2].downcase.capitalize
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
#nothing happens until we call the methods
students = input_students(cohorts)
print_header
print(students)
print_footer(students)
