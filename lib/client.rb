class Client
  attr_reader(:name, :stylist, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist = attributes.fetch(:stylist)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist.id()}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM clients;")
    clients = []
    results.each() do |result|
      name = result.fetch('name')
      id = result.fetch('id').to_i()
      stylist = Stylist.find(result.fetch('stylist_id').to_i())
      clients.push(Client.new({:name => name, :stylist => stylist, :id => id}))
    end
    clients
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all().each() do |client|
      if client.id().eql?(id)
        found_client = client
      end
    end
    found_client
  end

  define_method(:==) do |other|
    @id.eql?(other.id())
  end

  define_method(:update) do |new_attributes|
    @name = new_attributes.fetch(:name, @name)
    @stylist = new_attributes.fetch(:stylist, @stylist)
    stylist_id = @stylist.eql?(nil) ? 'null' : @stylist.id()
    DB.exec("UPDATE clients SET name = '#{@name}', stylist_id = #{stylist_id} WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{@id}")
  end
end
