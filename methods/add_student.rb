def add_student
  print 'Enter the name of the student: '
  name = gets.chomp.to_s
  print 'Enter the age of the student: '
  age = gets.chomp.to_i
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp.downcase

  validate_student_inputs(name, age, parent_permission)
end
