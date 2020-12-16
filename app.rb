require_relative './src/classes/library'

library = Library.new
file_name = "lib_data.yaml"

#  create YAML file
if !File.exist?(file_name)
  library.seed_authors(10)
  library.seed_books(3)
  library.seed_readers(40)
  library.seed_orders(150)
  
  library.save_file(file_name)
end

#  read YAML file
library.load_file(file_name)

puts "====="
puts "top readers:"
puts library.top_reader
puts "====="
puts "top of the most popular books:"
puts library.most_popular_books
puts "==="
puts "Qusntity of readers of the most popular books"
puts library.readers_of_popular_books