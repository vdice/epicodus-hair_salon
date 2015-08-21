require('spec_helper')

describe(Client) do
  before() do
    @stylist.save()
    @client.save()
  end

  describe('#name') do
    it('returns the client\'s name') do
      expect(@client.name()).to(eq('Bucephalus'))
    end
  end

  describe('#id') do
    it('returns the client\'s id') do
      expect(@client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#stylist') do
    it('returns the client\'s stylist') do
      expect(@client.stylist()).to(eq(@stylist))
    end
  end

  describe('.all') do
    it('returns all clients') do
      expect(Client.all()).to(eq([@client]))
    end
  end

  describe('#update') do
    before() do
      @alternate_stylist.save()
    end

    it('updates client particulars') do
      @client.update({:name => @alternate_client.name(), :stylist => @alternate_stylist})
      expect(@client.name()).to(eq(@alternate_client.name()))
      expect(@client.stylist()).to(eq(@alternate_stylist))
    end
    it('updates client name only') do
      @client.update({:name => @alternate_client.name()})
      expect(@client.name()).to(eq(@alternate_client.name()))
      expect(@client.stylist()).to(eq(@stylist))
    end
    it('updates client stylist only') do
      @client.update({:stylist => @alternate_stylist})
      expect(@client.name()).to(eq(@client.name()))
      expect(@client.stylist()).to(eq(@alternate_stylist))
    end
  end

  describe('#delete') do
    before() do
      @alternate_stylist.save()
      @alternate_client.save()
    end

    it('deletes a client') do
      @client.delete()
      expect(Client.all()).to(eq([@alternate_client]))
    end
  end
end
