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
end
