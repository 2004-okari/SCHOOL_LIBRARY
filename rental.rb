require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book

    @book.add_rental(self)
    @person.add_rental(self)
  end
end
