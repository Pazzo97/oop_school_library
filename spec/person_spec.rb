require_relative '../person'

describe Person do
  context 'When passing a name' do
    eid = Person.new(17, 'eid', parent_permission: false)
    patrick = Person.new(25, 'patrick')
    nameless = Person.new(20)
    it 'should return first letter capitalized' do
      expect(eid.correct_name).to eq 'Eid'
    end

    it 'should return false if he cannot use service' do
      expect(eid.can_use_services?).to eq false
    end

    it 'should return person age' do
      expect(eid.age).to eq 17
    end

    it 'should return patrick name' do
      expect(patrick.name).to eq 'patrick'
    end

    it 'should return Unknown as a name' do
      expect(nameless.name).to eq 'Unknown'
    end

    it 'should return true for parent permission' do
      expect(nameless.parent_permission).to eq true
    end

    it 'should return empty rental array' do
      expect(patrick.rentals.length).to eq 0
    end

    it 'should return true if he can use service' do
      expect(patrick.can_use_services?).to eq true
    end

    it 'should add into rentals' do
      eid.add_rental(eid)
      expect(eid.rentals.length).to eq 1
    end
  end
end
