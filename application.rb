require 'date'

class Person
  attr_accessor :first_name, :surname, :dob
  attr_reader :phone_number, :email
    
  def initialize(fname, sname, dob)
    @first_name = fname
    @surname = sname
    @dob = Date.parse(dob)
    @email = []
    @phone_number = []
  end
    
  def add_email(mail)
    @email << mail
    if 
      mail =~ /(\w+)[\@](\w+)[\.](\w{3})/
    else 
      raise 'Error: wrong format'
    end
  end
    
  def add_number(phone)
    @phone_number << phone
    if 
      phone =~ /^\d{3}/
    else 
      raise 'Error: wrong format'
    end
  end
    
  def remove_email(rmail)
    @email.delete_at(rmail)
  end
    
  def remove_number(rphone)
    @phone_number.delete_at(rphone)
  end

#yaml section...
    
  def load_yaml(person)
    data = YAML.load(File.open(person))
      
      data[:person].each do |yaml_person|
         person = Person.new(yaml_person[:fname], yaml_person[:sname], yaml_person[:dob])
      end
          
      yaml.person[:email].each do |x|
        person.add_email(x)
      end
          
      yaml.person[:phone_number].each do |y|
        person.add_number(y)
      end
      
      book << person
    end
    
end
#....................................................
class FamilyMember < Person
  attr_accessor :relationship
    
  def initialize (fname,sname,dob)
    @relationship = nil
    super
  end
    
  def to_s
    "#{@first_name} #{@surname} is person's #{@relationship}"
  end
    
end
#...................................................    
class AddressBook
  attr_reader :book
    
  def initialize
    @book = []
  end
  
  def add (pson)
    @book << pson
  end
    
  def list
    puts "Address Book\n ------------\n"
    book.each_with_index do |x,index|
      puts "Entry #{index+1}: #{x.fullname}\n"
    end
  end
      
   
  def delete(first_name) 
    book.each_with_index do |y, index| 
      book.delete_at (index) 
      if y.first_name == first_name
      else
      end
    end
  end

end
#.................................................
