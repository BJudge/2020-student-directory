#students = [
#  {name: "Dr. Hannibal Lecter", cohort: :November},
#  {name: "Darth Vader", cohort: :November},
#  {name:"Nurse Ratched", cohort: :November},
#  {name: "Michael Corleone", cohort: :November},
#  {name: "The Wicked Witch of the West", cohort: :November},
#  {name: "Terminator", cohort: :November},
#  {name: "Freddy Krueger", cohort: :November},
#  {name: "The Joker", cohort: :November},
#{name: "Joffrey Baratheon", cohort: :November},
#{name: "Norman Bates", cohort: :November},
#]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.delete!("\n")

  while !name.empty? do
    students << {name: name, cohort: :November}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end


def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)

  if students.empty?
    puts "No Students to print"
  else
    students.each_with_index { |chr, i| puts "#{i+1}: #{chr[:name]} (#{chr[:cohort]} cohort)".center(50)  }
  end
end

  def search_by_letter(students, search_character)
    students_value = (students.map {|student| [student[:name]]}).flatten
    result = students_value.select {|student| student.start_with?(search_character)}
    puts result
  end

  def search_by_length(students, search_length)
      students_value = (students.map {|student| [student[:name]]}).flatten
      result = students_value.find_all {|student| student.size <= search_length }
      puts result
  end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)
puts "Search for a student by first letter".center(50)
letter = gets.chomp
search_by_letter(students, letter)
puts "Search for a student by length of their name".center(50)
length_input = gets.delete!("\n").to_i
search_by_length(students, length_input)
