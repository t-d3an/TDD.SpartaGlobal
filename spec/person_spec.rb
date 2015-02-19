require 'spec_helper'

describe "Person" do
    
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
      #person.remove_email (0)
      expect(person.email) .to eq (["joe@foo.com"])
    end
      
    it "should add phone number" do
      person = Person.new "Joe", "Bloggs", "1 Jan 1990"
        
      person.add_number ("07712345678")
      expect(person.phone_number) .to eq (["07712345678"])
    end
  end
      
  describe "Relationship" do
    it "should add ralationship" do
      family = FamilyMember.new "Joe", "Bloggs", "1 Jan 1990"
      family.relationship = "mother"
      
      expect(family.relationship).to eq ('mother')
    end
  end
    
  describe "Address Book" do
      
    let(:book){book = AddressBook.new}
    let(:person1){person1 = Person.new "Joe", "Bloggs", "1 Jan 1990"}
    let(:person2){person2 = Person.new "andy", "nother", "2 Jan 1995"}
   
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
    
end
