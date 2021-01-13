module SeedHelper
  def seed_authors(quantity)
    authors = []
    quantity.times { authors << Author.new(Faker::Book.unique.author, 'some bio') }
    authors
  end

  def seed_books(authors, quantity)
    books = []
    authors.each do |author|
      rand(1..quantity).times { books << Book.new(Faker::Book.title, author) }
    end
    books
  end

  def seed_readers(quantity)
    readers = []
    quantity.times do
      name = Faker::Name.unique.name
      email = Faker::Internet.email(name: name)
      city = Faker::Address.city
      street = Faker::Address.street_name
      house = Faker::Address.building_number.to_i
      readers << Reader.new(name, email, city, street, house)
    end
    readers
  end

  def seed_orders(books, readers, quantity)
    orders = []
    quantity.times { orders << Order.new(books.sample, readers.sample) }
    orders
  end
end
