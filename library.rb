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
  attr_accessor :borrowed_books, :name, :rate_a_book 
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

def rate_a_book(single_book, book_rating, book_review = "This \
  book is not yet rated.")
@book_rating = book_rating
@book_review = book_review
single_book.rating_hash = {self.name => [book_rating, book_review]}
  puts "#{self.name} rated #{single_book.title} #{book_rating} stars and this is their review: #{book_review}."
  end

end


class Book
  attr_reader :title, :author
  attr_accessor :status, :borrower, :year_published, :edition, \
  :rating_hash
  def initialize(title, author, year_published = nil, edition = nil)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
    @year_published = year_published
    @edition = edition
    @rating_hash = {}
  end
end




