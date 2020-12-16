require 'faker'

module SeedHelper

  def seed_authors(qty)
    # generate Authors
    print "\n==> generating authors... "
    
    qty.times do 
      @authors << Author.new(Faker::Book.unique.author, 'some bio')
    end
    
    puts "done"
  end
  
  def seed_books(qty)
    # generate Books
    print "\n==> generating books... "
    
    @authors.each do |author|
      rand(1..qty).times { @books << Book.new(Faker::Book.unique.title, author.name) }
    end
    
    puts "done"
  end
  
  def seed_readers(qty)
    # generate Readers
    print "\n==> generating readers... "
    
    qty.times do
      name = Faker::Name.unique.name
      email = Faker::Internet.email(name: name)
      city = Faker::Address.city
      street = Faker::Address.street_name
      house = Faker::Address.building_number
      @readers << Reader.new(name, email, city, street, house)
    end
    
    puts "done"
  end
  
  def seed_orders(qty)
    # generate Orders
    print "\n==> generating orders... "
    
    qty.times do
      book_random = rand(0...@books.size)
      reader_random = rand(0...@readers.size)
      @orders << Order.new(book_random, reader_random)
    end
    
    puts "done"
  end

end