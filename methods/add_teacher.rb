def add_teacher
  print 'Enter the name of the teacher: '
  name = gets.chomp.to_s
  print 'Enter the age of the teacher: '
  age = gets.chomp.to_i
  print "And teacher's specialization: "
  specialization = gets.chomp.to_s

  validate_teacher_inputs(name, age, specialization)
end
