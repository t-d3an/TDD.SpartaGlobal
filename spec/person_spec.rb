require 'spec_helper'

describe "Person" do
#................................................
  describe "Personal information" do
      
    it "should print out personal info" do
        
      person = Person.new "Joe", "Bloggs", "1 Jan 1990"
        
      expect(person.dob).to be_a(Date)
      expect(person.dob.to_s).to eq('1990-01-01')
      expect(person.first_name).to eq ('Joe')
      expect(person.surname).to eq ('Bloggs')     
      expect(person.email).to eq (Array.new)
      expect(person.phone_number).to eq (Array.new)
    end
      
    it "should add email" do
      person = Person.new "Joe", "Bloggs", "1 Jan 1990"
        
      person.add_email ("joe@foo.com")
      #to remove: person.remove_email (0) 
      expect(person.email) .to eq (["joe@foo.com"])
      expect{person.add_email"This is a wrong email"}.to raise_error 
    end
      
    it "should add phone number" do
      person = Person.new "Joe", "Bloggs", "1 Jan 1990"
        
      person.add_number ("07712345678")
      #to remove : person.remove_number (0)
      expect(person.phone_number) .to eq (["07712345678"])
      expect{person.add_phone"This is a wrong phone"}.to raise_error 
    end
      
#yaml...
    it "should load yaml file" do 
      
      expect(book.file('person.yaml')).to be_a(File) 
 
      book.file('person.yaml') 
      book.load
        
      expect(book.addressbook[0].fname).to eq(person1) 
      expect(book.addressbook[1].fname).to eq(person2) 
 
      expect(book.addressbook[0].email).to eq(email1) 
      expect(book.addressbook[1].email).to eq(email2)         
      expect(book.addressbook[0].phone_number).to eq(phone1) 
      expect(book.addressbook[1].phone_numbers).to eq(phone2)         
     end
      
  end

#...............................................
  describe "Relationship" do
      
    it "should add ralationship" do
      family = FamilyMember.new "Joe", "Bloggs", "1 Jan 1990"
    
    #example relationship test
      family.relationship = "mother"
      expect(family.relationship).to eq ('mother')
    end
      
  end
#...............................................    
  describe "Address Book" do
      
    let(:book){book = AddressBook.new}
    let(:person1){person1 = Person.new "Joe", "Bloggs", "1 Jan 1990"}
    let(:person2){person2 = Person.new "Andy", "Nother", "2 Jan 1995"}
   
    it "should add address book" do
    book = AddressBook.new
    book.add person1
    book.add person2
    expect(book).to be_a (AddressBook)
    end
      
    it "should remove person from their first name" do 
    book.add person1 
    book.add person2 
    book.delete ('Joe')
    expect(book.book).not_to include person1    
    end
    
  end
#..............................................    
end