require('rspec')
# require('dealership')
require('contact')
require('phone_numbers')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#first_name') do
    it('returns the contacts first name') do
      test_contact = Contact.new({:first_name => "Mike", :last_name => "Williams", :job_title => "garbage man", :company => "Mike's Garbage"})
      expect(test_contact.first_name()).to(eq("Mike"))
    end
  end

  describe('.find') do
    it('returns a contact by its id number') do
      test_contact = Contact.new({:first_name => "Mike", :last_name => "Williams", :job_title => "garbage man", :company => "Mike's Garbage"})
      test_contact.save()
      test_contact_2 = Contact.new({:first_name => "Bob", :last_name => "Smith", :job_title => "accountant", :company => "Mike's Garbage"})
      test_contact_2.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end

  describe("#add_phone_number") do
    it('save our phone number to a contact') do
      test_contact = Contact.new({:first_name => "Mike", :last_name => "Williams", :job_title => "garbage man", :company => "Mike's Garbage"})
      test_contact.save()
      test_phone_number = Phone_number.new({:area_code => 509, :number => 9216882, :type => "home phone"})
      test_phone_number.save()
      test_contact.add_phone_number(test_phone_number)
      expect(test_contact.phone_numbers()).to(eq([test_phone_number]))
    end
  end
end
