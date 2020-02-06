require('pry-byebug')
require_relative('../models/student')
require_relative('../models/house')

House.delete_all()
Student.delete_all()


house1 = House.new({
  "name" => "Gryffindor"
})
house1.save

house2 = House.new({
  "name" => "Hufflepuff"
})
house2.save

house3 = House.new({
  "name" => "Ravenclaw"
})
house3.save

house4 = House.new({
  "name" => "Slytherin"
})
house4.save


student1 = Student.new({
  "first_name" => "Barry",
  "last_name" => "Trotter",
  "house_id" => house1.id,
  'age' => 12
})
student1.save

student2 = Student.new ({
  "first_name" => "Don",
  "last_name" => "Sneezly",
  "house_id" => house2.id,
  "age" => 17
})
student2.save

student3 = Student.new ({
  "first_name" => "Serious",
  "last_name" => "Jack",
  "house_id" => house3.id,
  "age" => 10
 })
 student3.save

 student4 = Student.new ({
   "first_name" => "Crying",
   "last_name" => "Turtle",
   "house_id" => house4.id,
   "age" => 14
   })
student4.save
#
# binding.pry
# nil
