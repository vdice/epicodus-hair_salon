class Client
  attr_reader(:name, :stylist, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist = attributes.fetch(:stylist)
    @id = nil
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist.id()}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end
end
