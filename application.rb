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
  end
    
  def add_number(phone)
    @phone_number << phone
  end
    
  def remove_email(rmail)
    @email.delete_at(rmail)
  end
    
  def remove_number(rphone)
    @phone_number.delete_at(rphone)
  end
end
    
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
