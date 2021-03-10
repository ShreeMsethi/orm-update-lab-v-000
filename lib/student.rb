# require_relative "../config/environment.rb"

# class Student

#   # Remember, you can access your database connection anywhere in this class
#   #  with DB[:conn]

#   attr_accessor :name, :grade, :id
 
  
#   def initialize(name, grade, id=nil)
#     @id = id
#     @name = name
#     @grade = grade
#   end
  
#   # ___________________________________________________
  
#   def self.create_table
#   sql = <<-SQL
#   CREATE TABLE IF NOT EXISTS students (
#   id INTEGER PRIMARY KEY, name TEXT, grade INTEGER)
#   SQL
    
#     DB[:conn].execute(sql)
#   end
  
# # ___________________________________________________
 
#   def self.drop_table
#     sql = <<-SQL
#     DROP TABLE students
#     SQL
    
#     DB[:conn].execute(sql)
#   end
  
#   # ___________________________________________________
  
#   def save
#     if self.id
#       self.update
#     else
#       sql = <<-SQL
#       INSERT INTO students (name, grade) VALUES
#       (?, ?)
#       SQL
    
#       DB[:conn].execute(sql, self.name, self.grade)
#       @id = DB[:conn].execute("SELECT last_insert_rowid()
#       FROM students")[0][0]
#     end
#   end
  
#   # ___________________________________________________
  
#   def self.create(name, grade)
#     student = self.new(name, grade)
#     student.save
#     student
#   end
  
#   # ___________________________________________________
#   # Why doesn't this method work
#   # def self.new_from_db(row)
#   #   new_student = self.new(name, grade)
#   #   new_student.id = row[0]
#   #   new_student.name = row[1]
#   #   new_student.grade = row[2]
#   #   new_student
#   # end
  
#   # ___________________________________________________
  
#   def self.new_from_db(row)
#     id = row[0]
#     name = row[1]
#     grade = row[2]
    
#     new_student = self.new(name, grade)
#     new_student.id = id
#     new_student
#   end
  
#   # ___________________________________________________
  
#   def self.find_by_name(name)
#     sql = <<-SQL
#       SELECT * FROM students
#       WHERE name = ?
#       LIMIT 1
#     SQL
    
#     DB[:conn].execute(sql, name).map do |row|
#       self.new_from_db(row)
#     end.first
#   end
  
#   # ___________________________________________________
  
#   def update
#     sql= <<-SQL
#       UPDATE students SET 
#       name = ?, grade = ? 
#       WHERE id = ?
#     SQL
    
#     DB[:conn].execute(sql, self.name, self.grade, self.id)
#   end
# end

class Student
  attr_accessor :id, :name, :grade
  
  def initialize(id=nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXIST (id INTEGER PRIMARY KEY, name TEXT, grade TEXT)
    SQL
    
    DB[:conn].execute(sql)
  end    
end












