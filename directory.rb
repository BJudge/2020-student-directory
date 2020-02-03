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
@students = []
def interactive_menu

  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @students
  name = gets.delete!("\n")

  while !name.empty? do
    @students << {name: name, cohort: :November}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
  @students
end


def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print

  if @students.empty?
    puts "No Students to print"
  else
    @students.each_with_index { |chr, i| puts "#{i+1}: #{chr[:name]} (#{chr[:cohort]} cohort)".center(50)  }
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Search for student by first letter"
  puts "4. Search for student by length of name"
  puts "5. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    puts "Search for a student by first letter".center(50)
    letter = gets.chomp
    search_by_letter(letter)
  when "4"
    puts "Search for a student by length of their name".center(50)
    length_input = gets.delete!("\n").to_i
    search_by_length(length_input)
  when "5"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

  def search_by_letter(search_character)
    students_value = (@students.map {|student| [student[:name]]}).flatten
    result = students_value.select {|student| student.start_with?(search_character)}
    puts result
  end

  def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
  end

  def search_by_length(search_length)
      students_value = (@students.map {|student| [student[:name]]}).flatten
      result = students_value.find_all {|student| student.size <= search_length }
      puts result
  end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end

interactive_menu
