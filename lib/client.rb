class Client
  attr_reader(:name, :stylist)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist = attributes.fetch(:stylist)
  end
end
