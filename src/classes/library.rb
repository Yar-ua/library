require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'

class Library
  attr_accessor :authors, :books, :orders, :readers
  
  def initialize(authors = [], books = [], orders = [], readers = [])
    @authors = authors
    @books = books
    @orders = orders
    @readers = readers
  end
end