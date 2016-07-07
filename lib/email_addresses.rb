class Email_address
  attr_reader(:address, :type)
  @@emails = []

  define_method(:initialize) do |attributes|
    @address = attributes.fetch(:address)
    @type = attributes.fetch(:type)
    @id = @@emails.length() + 1
  end

  define_singleton_method(:find) do |identification|
    found_email = nil
    @@emails.each() do |email|
      if email.id().eql?(identification.to_i())
        found_email = email
      end
    end
    found_email
  end

  define_method(:save) do
    @@emails.push(self)
  end

  define_method(:clear) do
    @@emails = []
  end
end
