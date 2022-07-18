require_relative './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    @name = name
    super(age, parent_permission: parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
