require_relative '../teacher'

describe Teacher do
  context 'When adding a new teacher' do
    teacher = Teacher.new('Math', 37, 'John')

    it 'creates a new teacher' do
      expect(teacher).to be_an_instance_of Teacher
    end

    it 'Teacher can use services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
