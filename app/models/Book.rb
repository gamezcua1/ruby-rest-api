# frozen_string_literal: true

require_relative '../../lib/model'

class Book < Model
  def initialize(name:"", year:"", author:"", category:"")
    @collection = :books
    @document = {
      name: name,
      year: year,
      author: author,
      category: category
    }
  end
end

