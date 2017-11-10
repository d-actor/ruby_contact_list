require 'pry'

@contact_array = []

def menu
  puts "--- Contact List Menu ---"
  puts "1) All Contacts"
  puts "2) Create Contact"
  puts "3) Delete Contact"
  puts "4) Edit Contact"
  puts "5) Exit"
  print "Choose an option: "
  option = gets.chomp
  exit (0) if option == "5"
  option.to_i
end

def contact_create
  puts "What is the contact name?"
  contact_name = gets.chomp
  if contact_name.length > 0
    @contact_array << contact_name
    puts "Contact with name #{contact_name} added."
  else
    puts "Please enter a contact name"
  end
  puts "What is the contact phone number?"
  number = gets.chomp
  if number.length >=9
    @contact_array << number
    puts "Phone number #{number} added."
  else
    puts "Please enter a phone number."
  end
  puts "What is the contact email?"
  email = gets.chomp
  if email.length > 5
    @contact_array << email
    puts "Email #{email} added."
  end
end

def contact_delete
  puts "Enter the contact you would like to delete: "
  name = gets.chomp
  puts "Are you sure you want to delete #{name}?"
  answer = gets.chomp
  case answer
  when "Yes", "Y", "YES", "yes", "y"
    @contact_array.delete(name)
    puts "#{name} has been deleted."
  when "No", "N", "NO", "no", "n"
    puts "#{name} has not been deleted"
  end
end

def contact_edit
  puts "Enter the name of the contact you would like to edit: "
  name = gets.chomp
  puts "Editing: #{name}"
  puts "Enter the new data: "
  data = gets.chomp
  puts "Are you sure you want to update #{name} to #{data}?"
  answer = gets.chomp
  case answer
  when "Yes", "Y", "YES", "yes", "y"
    @contact_array.delete(name)
    @contact_array << data
    puts "The contact has been updated"
  else
    puts "The contact has not been updated"
  end
end

#edit soultion
#def edit_contact
#  puts 'Select a contact to edit'
#  puts @contact_array.join("\n")
#  choice = gets.to_i
#  index = choice - 1
#  contact = @contact_array[index]
#  puts "enter a new name for #{@contact_array[:name]}"
#  name = gets.strip
#  @contact_array[:name] = name
#end

while true
  case menu
    when 1
      puts @contact_array.join("\n")
    when 2
      contact_create
    when 3
      contact_delete
    when 4
      contact_edit
    else
      puts "Come on... this isn't complicated."
      menu
  end
end
