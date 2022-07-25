def add_teacher
  print 'Enter the name of the teacher: '
  name = gets.chomp.to_s
  print 'Enter the age of the teacher: '
  age = gets.chomp.to_i
  print "And teacher's specialization: "
  specilization = gets.chomp.to_s
  teacher = Teacher.new(specilization, age, name)
  @persons << teacher

  puts "Teacher with id #{teacher.id} successfully created"
end
