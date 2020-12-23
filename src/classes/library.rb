# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'
require_relative './modules/seed_helper'
require 'yaml'

# Description/Explanation of Library class
class Library
  include SeedHelper
  attr_reader :authors, :books, :orders, :readers

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
  end

  def create(file_name)
    File.open(file_name, 'w') { |file| file.write(to_yaml) }
  end

  def read(file_name)
    data = YAML.load_file(file_name)
    @authors = data.authors
    @books = data.books
    @orders = data.orders
    @readers = data.readers
  end

  def top_reader(qty = 1)
    select_data(:reader, qty).map(&:name)
  end

  def most_popular_books(qty = 1)
    select_data(:book, qty).map(&:title)
  end

  def readers_of_popular_books(qty = 3)
    books = select_data(:book, qty)
    @orders.select { |order| books.include? order.book }.map(&:reader).uniq.size
  end

  private

  def select_data(method, element_qty)
    @orders.group_by(&method)
           .max_by(element_qty) { |_, value| value.length }
           .to_h.keys
  end
end
