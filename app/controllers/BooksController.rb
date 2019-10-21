require_relative '../models/Book.rb'

class BooksController
  def self.index(_req, res)
    res.response = 'all my books'
  end

  def self.show(_req, _res)
    b = Book.new(name: 'book name',  year: 123, author: 'Nice author', 
                 category: 'Thriller')
    b.save
  end

  def self.create(req, res)
    puts req
    puts res
  end
end

