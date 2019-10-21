require_relative '../lib/router'

require_relative './controllers/BooksController'

Router.get('/books', BooksController, 'index')
Router.get('/books/:id', BooksController, 'show')
Router.post('/books', BooksController, 'create')
