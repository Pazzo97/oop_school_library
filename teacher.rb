require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission: parent_permission)
    @specialization = specialization
    @name = name
  end

  def can_use_services?
    true
  end
end
