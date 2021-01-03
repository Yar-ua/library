# frozen_string_literal: true

# Description/Explanation of SeedHelper module
module SeedHelper
  def seed_authors(qty)
    qty.times do
      @authors << Author.new(Faker::Book.unique.author, 'some bio')
    end
  end

  def seed_books(qty)
    @authors.each do |author|
      rand(1..qty).times { @books << Book.new(Faker::Book.title, author) }
    end
  end

  def seed_readers(qty)
    qty.times do
      name = Faker::Name.unique.name
      email = Faker::Internet.email(name: name)
      city = Faker::Address.city
      street = Faker::Address.street_name
      house = Faker::Address.building_number.to_i
      @readers << Reader.new(name, email, city, street, house)
    end
  end

  def seed_orders(qty)
    qty.times do
      @orders << Order.new(@books.sample, @readers.sample)
    end
  end
end
