class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM stylists;")
    stylists = []
    results.each() do |result|
      name = result.fetch('name')
      id = result.fetch('id').to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
    name = result.first().fetch('name')
    Stylist.new({:name => name, :id => id})
  end

  define_method(:==) do |other|
    @id.eql?(other.id())
  end

  define_method(:update) do |new_attributes|
    @name = new_attributes.fetch(:name, @name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")

    new_attributes.fetch(:client_ids, []).each() do |client_id|
      DB.exec("UPDATE clients SET stylist_id = #{@id} WHERE id = #{client_id};")
    end
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{@id};")
  end

  define_method(:clients) do
    results = DB.exec("SELECT * FROM clients WHERE stylist_id = #{@id};")
    clients = []
    results.each() do |result|
      name = result.fetch('name')
      stylist = self
      id = result.fetch('id').to_i()
      clients.push(Client.new({:name => name, :stylist => stylist, :id => id}))
    end
    clients
  end
end
