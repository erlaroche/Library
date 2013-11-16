class Library
  def initialize
    @books = []
  end

  def books
    @books
  end

  def list_books
    @books.each do |bk| 
      puts "These are the book titles: #{bk.title} and their status is #{bk.status}."
    end
  end


  def borrowed_books
    @books.each do |book|
      if book.status == "unavailable"
        puts "#{book.title} has been checked out by #{book.borrower.name}."
      end
    end
  end

  def available_books
    @books.each do |book|
      if book.status == "available"
        puts "#{book.title} to the Library!"
      end
    end
  end

  def add_book(book)
    @books << book
    puts "You added #{book.title} to the library!"
  end

  def check_out(user, book)
    if user.borrowed_books.length >= 2
      puts "Sorry, you are at your max number of books (2)."
      return
    end
    
    if 
      book.status == "available"
      user.borrowed_books << book
      book.status = "unavailable"
      book.borrower = user

      else 
        book.status == "unavailable"
        puts "Sorry, #{book.title} has been checked-out by #{user.name}. "
    end
  end

  def check_in(book)
    @book = book
  end
end

class Borrower
  attr_accessor :borrowed_books
  def initialize(name)
    @name = name
    @borrowed_books = []
    puts "#{name} is the new borrower."
  end

  # def borrowed_books
  #   @borrowed_books
  # end

  def name
    @name
  end

  def borrowed_books_count
     return @books.length
  end

  def borrowed_books_list
    borrowed_books.each do |bk| 
      puts "#{bk.title} is borrowed by #{name}"
    end
  end
end

class Book
  attr_reader :title, :author
  attr_accessor :status, :borrower
  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
  end
end

