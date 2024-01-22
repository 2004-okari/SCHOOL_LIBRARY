# user_interactions.rb
class UserInteractions
  def initialize(app)
    @app = app
  end

  def list_all_books
    @app.list_all_books
    list_numbers
  end

  def list_all_people
    @app.list_all_people
    list_numbers
  end

  def create_a_person
    puts 'Enter person name:'
    name = gets.chomp

    puts 'Enter person age:'
    age = gets.chomp.to_i

    @app.create_a_person(name, age)
    list_numbers
  end

  def create_a_book
    puts 'Enter book title:'
    title = gets.chomp

    puts 'Enter book author:'
    author = gets.chomp

    @app.create_a_book(title, author)
    list_numbers
  end

  def create_a_rental
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    puts 'Enter book ID:'
    book_id = gets.chomp.to_i

    @app.create_a_rental(person_id, book_id)
    list_numbers
  end

  def list_all_rentals_for_a_given_person_id
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    @app.list_all_rentals_for_a_given_person_id(person_id)
    list_numbers
  end

  def exit
    puts 'Exiting...'
  end

  def invalid
    puts 'Invalid choice. Please try again.'
    list_numbers
  end

  def list_numbers
    puts 'Please choose an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person ID'
    puts '7. Exit'

    choice = gets.chomp.to_i

    case choice
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals_for_a_given_person_id
    when 7
      exit
    else
      invalid
    end
  end
end