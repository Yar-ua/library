require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'
require_relative './modules/seed_helper'
require 'yaml'

class Library
  include SeedHelper
  attr_accessor :authors, :books, :orders, :readers
  
  def initialize(authors = [], books = [], orders = [], readers = [])
    @authors = authors
    @books = books
    @orders = orders
    @readers = readers
  end

  def save_file(file_name)
    print "\ncreating data YAML file..."
    File.new(file_name, 'w')
    File.open(file_name, 'w') { |file| file.write(self.to_yaml) }
    puts 'file created'
  end
  
  def load_file(file_name)
    if File.exist?(file_name)
      print "\nreading data file... "
      data = YAML.load_file(file_name)
      @authors = data.authors
      @books = data.books
      @orders = data.orders
      @readers = data.readers
      puts 'done'
    else
      puts 'Cannot load data - no data file'
    end
  end
  
  def top_reader
    readers = []
    select_data(3, :reader).each {|reader| readers << reader.name}
    readers
  end
  
  def most_popular_books
    books = []
    select_data(3, :book).each {|book| books << book.title}
    books
  end
  
  def readers_of_popular_books
    books = select_data(3, :book)
    @orders.select { |order| books.include? order.book }.map(&:reader).uniq.size
  end
  
  
  private

  def select_data(elements_qty, method)
    @orders.group_by(&method)
           .max_by(elements_qty) { |_, value| value.length }
           .to_h.keys
  end

end