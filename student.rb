require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(id, name, age, classroom = nil)
    super(id, name, age)
    self.classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
