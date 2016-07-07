class Contact
  attr_reader(:first_name, :last_name, :job_title, :company)
  @@contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @phone_numbers = []
    @email_addresses = []
    @mailing_addresses = []
    @id = @@contacts.length() + 1
  end

  define_method(:phone_numbers) do
    @phone_numbers
  end

  define_method(:email_addresses) do
    @email_addresses
  end

  define_method(:mailing_addresses) do
    @mailing_addresses
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add_phone_number) do |phone_number|
    @phone_numbers.push(phone_number)
  end

  define_method(:add_email_address) do |email|
    @email_addresses.push(email)
  end

  define_method(:add_mailing_address) do |address|
    @mailing_addresses.push(address)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end
end
