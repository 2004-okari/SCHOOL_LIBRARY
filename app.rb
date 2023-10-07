require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    puts 'List of People:'
    @people.each do |person|
      puts "Name: #{person.name} (ID: #{person.id})"
    end
  end

  def create_person
    puts "Enter person's name:"
    name = gets.chomp

    puts "Enter person's age:"
    age = gets.chomp.to_i

    puts "Enter person's type ('t' for teacher, 's' for student):"
    type = gets.chomp

    case type
    when 't'
      puts "Enter teacher's specialization:"
      specialization = gets.chomp

      person = Teacher.new(name, age, specialization)
    when 's'
      puts "Enter student's classroom:"
      classroom = gets.chomp

      puts 'Does the student have parent permission? (y/n):'
      parents_permission = gets.chomp.downcase == 'y'

      person = Student.new(name, age, classroom, parents_permission)
    else
      puts "Invalid choice. Please choose 't' for teacher or 's' for student."
      return
    end

    @people << person
    puts 'Person created successfully.'
  end

  def create_book
    puts "Enter book's title:"
    title = gets.chomp

    puts "Enter book's author:"
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  def create_rental
    puts "Enter person's ID:"
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found.'
      return
    end

    puts "Enter book's title:"
    book_title = gets.chomp

    book = @books.find { |b| b.title == book_title }
    if book.nil?
      puts 'Book not found.'
      return
    end

    puts 'Enter rental date (YYYY-MM-DD):'
    date = gets.chomp

    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully.'
  end

  def list_rentals_for_person
    puts "Enter person's ID:"
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found.'
      return
    end

    puts "Rentals for #{person.name}:"
    rentals = @rentals.select { |r| r.person == person }
    rentals.each do |rental|
      puts "#{rental.book.title} (Rented on #{rental.date})"
    end
  end
end
