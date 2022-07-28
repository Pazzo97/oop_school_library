require_relative './nameable'

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name(name)
    name.capitalize
  end
end
