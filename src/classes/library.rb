require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'
require_relative './modules/seed_helper'

class Library
  include SeedHelper
  attr_accessor :authors, :books, :orders, :readers
  
  def initialize(authors = [], books = [], orders = [], readers = [])
    @authors = authors
    @books = books
    @orders = orders
    @readers = readers
  end

end