class BooksController
  def self.index(req, res)
    res.response = "all my books"
  end

  def self.show(req, res)
    puts "Here"
    res.response = "displaying a book"
  end

end

