require_relative '../student'

describe Student do
  context 'When adding a new student' do
    student = Student.new(25, 'Patrick', parent_permission: true)

    it 'creates a new student' do
      expect(student).to be_an_instance_of Student
    end

    it 'Student can use services' do
      expect(student.can_use_services?).to eq true
    end

    it 'Should return "¯\\(ツ)/¯" when play hocky is called ' do
      expect(student.play_hooky).to eq '¯\\(ツ)/¯'
    end
  end
end
