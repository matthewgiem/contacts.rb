class Phone_number
  attr_reader(:area_code, :number, :type)
  @@numbers = []

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
    @id = @@numbers.length() + 1
  end

  define_singleton_method(:find) do |identification|
    found_number = nil
    @@numbers.each() do |number|
      if number.id().eql?(identification.to_i())
        found_number = number
      end
    end
    found_number
  end

  define_method(:save) do
    @@numbers.push(self)
  end

  define_method(:clear) do
    @@numbers = []
  end
end
