require_relative '../lib/router'

require_relative 'BooksController'


Router.get('/books', BooksController, 'index')
Router.get('/book/:id', BooksController, 'show')

