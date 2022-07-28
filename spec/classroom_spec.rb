require_relative '../classroom'

describe Classroom do
  classroom = Classroom.new('Grade 1')

  it 'creates a new classroom' do
    expect(classroom).to be_an_instance_of Classroom
  end

  it 'Classroom has a label' do
    expect(classroom.label).to eq 'Grade 1'
  end

  it 'Classroom has students' do
    expect(classroom.students).to eq []
  end

  it 'Classroom can add students' do
    classroom.add_student(Student.new(25, 'Patrick', parent_permission: true))
    expect(classroom.students.length).to eq 1
  end
end
