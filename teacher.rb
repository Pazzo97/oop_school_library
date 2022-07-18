require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    @name = name
    super(age, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end
