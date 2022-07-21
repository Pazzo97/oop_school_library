require_relative './person'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission: parent_permission)
    @name = name
    @classroom = nil
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self
  end
end
