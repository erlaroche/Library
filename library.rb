class Library
  def initialize
    @books = []
  end

  def list_books
    puts "These are the book titles:" 
    @books.each do |single_book| 
      puts "#{single_book.title} and its status is #{single_book.status}."
    end
  end


  def borrowed_books
    @books.each do |single_book|
      if single_book.status == "unavailable"
        puts "#{single_book.title} has been checked out by #{single_book.borrower.name}."
      end
    end
  end

  def available_books
    @books.each do |single_book|
      if single_book.status == "available"
        puts "#{single_book.title} to the Library!"
      end
    end
  end

  def add_book(single_book)
    @books << single_book
    puts "You added #{single_book.title} to the library!"
  end

  def check_out(user, single_book)
    if user.borrowed_books.length >= 2
      puts "Sorry, you are at your max number of books (2)."
      return
    end
    
    if 
      single_book.status == "available"
      user.borrowed_books << single_book
      single_book.status = "unavailable"
      single_book.borrower = user

      else 
        single_book.status == "unavailable"
        puts "Sorry, #{single_book.title} has been checked-out \
        by #{user.name}. "
    end
  end

  def check_in(single_book)
    @book = single_book
  end
end

class Borrower
  attr_accessor :borrowed_books, :name
  def initialize(name)
    @name = name
    @borrowed_books = []
    puts "#{name} is the new borrower."
  end

  def borrowed_books_count
     return @books.length
  end

  def borrowed_books_list
    borrowed_books.each do |single_book| 
      puts "#{single_book.title} is borrowed by #{name}"
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

