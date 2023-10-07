require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def initialize(id, name, age, classroom = nil)
    super(id, name, age)
    self.classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.nil? || !classroom.respond_to?(:students) || classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end