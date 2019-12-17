require_relative "../config/environment.rb"

class Student
  
  attr_accessor :name, :grade, :id
  
  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade
    @id = id
  end
  
  def save
    sql = <<-SQL
      INSERT INTO students
    SQL
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students(
        id INTEGER PRIMAY KEY,
        name TEXT,
        grade INTEGER)
    SQL
    
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS students")
  end
  
end

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]