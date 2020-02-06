require_relative('../db/sql_runner')

class House

  attr_reader :id, :name

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
end

def save()
  sql = "INSERT INTO houses
  (
    name
  ) VALUES
  (
    $1
  ) RETURNING id"
  values = [@name]
  house_data = SqlRunner.run(sql, values)
  @id = house_data.first()['id'].to_i
end

def self.find_by_id(id)
  sql = "SELECT * FROM houses
  WHERE id = $1"
  value = [id]
  house_data = SqlRunner.run(sql, value)[0]
  return House.new(house_data)
end

def self.all()
  sql = "SELECT * FROM houses"
  houses = SqlRunner.run(sql)
  return House.map_items(houses)
end


def self.delete_all
  sql = "DELETE FROM houses"
  SqlRunner.run(sql)
end

def self.map_items(house_data)
  result = house_data.map {|house| House.new(house)}
  return result
end


end
