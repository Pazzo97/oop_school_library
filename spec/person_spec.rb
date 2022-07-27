require_relative '../person'

describe Person do
  context 'When passing a name' do
    eid = Person.new(17, 'eid')
    patrick = Person.new(25, 'patrick')
    it 'should return first letter capitalized' do
      expect(eid.correct_name).to eq 'Eid'
    end

    it 'should return false if he cannot use service' do
      expect(eid.can_use_services?).to eq false
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
