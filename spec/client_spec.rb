require('spec_helper')

describe(Client) do
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
    it('updates client particulars') do
      alternate_stylist = Stylist.new({:name => 'Philonicus the Thessalian', :id => nil})
      alternate_stylist.save()
      @client.update({:name => 'Buce', :stylist => alternate_stylist})
      expect(@client.name()).to(eq('Buce'))
      expect(@client.stylist()).to(eq(alternate_stylist))
    end
    it('updates client name only') do
      @client.update({:name => 'Buce'})
      expect(@client.name()).to(eq('Buce'))
      expect(@client.stylist()).to(eq(@stylist))
    end
    it('updates client stylist only') do
      alternate_stylist = Stylist.new({:name => 'Philonicus the Thessalian', :id => nil})
      alternate_stylist.save()
      @client.update({:stylist => alternate_stylist})
      expect(@client.name()).to(eq(@client.name()))
      expect(@client.stylist()).to(eq(alternate_stylist))
    end
  end
end
