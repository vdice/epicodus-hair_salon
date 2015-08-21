require('spec_helper')

describe(Client) do
  describe('#name') do
    it('returns the name of the client') do
      expect(@client.name()).to(eq('Bucephalus'))
    end
  end

  describe('#id') do
    it('returns the id of the client') do
      expect(@client.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
