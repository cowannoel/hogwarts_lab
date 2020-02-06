require_relative('../db/sql_runner')

class Student

  attr_reader :first_name, :last_name, :house_id, :age

def initialize(options)
  @id = options['id'].to_i if options['id']
  @first_name = options['first_name']
  @last_name = options['last_name']
  @house_id = options['house_id'].to_i
  @age = options['age'].to_i
end

def save()
  sql = "INSERT INTO students
  (
    first_name,
    last_name,
    house_id,
    age
  ) VALUES
  (
    $1, $2, $3, $4
  ) RETURNING id"
  values = [@first_name, @last_name, @house_id, @age]
  student_data = SqlRunner.run(sql, values)
  @id = student_data.first()['id'].to_i
end

def house_name()
  sql = "SELECT houses.name FROM houses
  WHERE id = $1"
  value = [@house_id]
  house = SqlRunner.run(sql, value).first
  return house['name']
end



def self.find_by_id(id)
  sql = "SELECT * FROM students
  WHERE id = $1"
  value = [id]
  student = SqlRunner.run(sql, value)[0]
  return Student.new(student)
end

def self.all()
  sql = "SELECT * FROM students"
  students = SqlRunner.run(sql)
  return Student.map_items(students)
end

def self.delete_all
  sql = "DELETE FROM students"
  SqlRunner.run(sql)
end



  def self.map_items(student_data)
    result = student_data.map {|student| Student.new(student)}
    return result
  end


end
