require('spec_helper')

describe(Stylist) do
  before() do
    @stylist.save()
    @client.save()
  end

  describe('#name') do
    it('returns the name of the stylist') do
      expect(@stylist.name()).to(eq('Alexander'))
    end
  end

  describe('#id') do
    it('returns the id of the stylist') do
      expect(@stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('returns the stylist based on id') do
      expect(Stylist.find(@stylist.id())).to(eq(@stylist))
    end
  end

  describe('.all') do
    it('returns all stylists') do
      expect(Stylist.all()).to(eq([@stylist]))
    end
  end

  describe('#update') do
    before(:each) do
      @alternate_stylist.save()
      @alternate_client.save()
    end

    it('updates stylist particulars') do
      @stylist.update({:name => @alternate_stylist.name(), :client_ids => [@client.id()]})
      expect(@stylist.name()).to(eq(@alternate_stylist.name()))
      expect(@stylist.clients()).to(eq([@client]))
    end
    it('updates stylist name only') do
      @stylist.update({:name => @alternate_stylist.name()})
      expect(@stylist.name()).to(eq(@alternate_stylist.name()))
      expect(@stylist.clients()).to(eq([@client]))
    end
    it('updates stylist clients only') do
      @stylist.update({:client_ids => [@client.id(), @alternate_client.id()]})
      expect(@stylist.name()).to(eq(@stylist.name()))
      expect(@stylist.clients()).to(eq([@client, @alternate_client]))
    end
  end

  describe('#delete') do
    before() do
      @alternate_stylist.save()
    end

    it('deletes a stylist') do
      @stylist.delete()
      expect(Stylist.all()).to(eq([@alternate_stylist]))
    end
  end
end
