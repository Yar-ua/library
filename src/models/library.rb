class Library
  include SaveLoadHelper
  include SeedHelper
  attr_reader :authors, :books, :orders, :readers

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
  end

  def create_seeds
    @authors = seed_authors(10)
    @books = seed_books(@authors, 3)
    @readers = seed_readers(40)
    @orders = seed_orders(@books, @readers, 100)
  end

  def load_db(file_name)
    data = load_file(file_name)
    @authors = data.authors
    @books = data.books
    @orders = data.orders
    @readers = data.readers
  end

  def top_reader(quantity = 1)
    select_data(:reader, quantity).map(&:name)
  end

  def most_popular_books(quantity = 1)
    select_data(:book, quantity).map(&:title)
  end

  def readers_of_popular_books(quantity = 3)
    books = select_data(:book, quantity)
    @orders.select { |order| books.include? order.book }.map(&:reader).uniq.size
  end

  private

  def select_data(method, element_quantity)
    @orders.group_by(&method)
           .max_by(element_quantity) { |_, value| value.length }
           .to_h.keys
  end
end
