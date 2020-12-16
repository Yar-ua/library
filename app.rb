require_relative './src/classes/library'
require 'yaml'

@config = YAML::load_file(File.join(__dir__, 'config', 'config.yml'))

def set_seeds(cnf)
  @library.seed_authors(cnf['authors'])
  @library.seed_books(cnf['books'])
  @library.seed_readers(cnf['readers'])
  @library.seed_orders(cnf['orders'])
end

def stata_output
  puts "====="
  puts "Top readers: #{@library.top_reader.join(', ')}"
  puts "====="
  puts "Top of the most popular books: #{@library.most_popular_books.join(', ')}"
  puts "====="
  puts "Quantity of readers of the most popular books: #{@library.readers_of_popular_books}"
end

@library = Library.new
file_name = @config['data_filename']

# create YAML file
if !File.exist?(file_name)
  set_seeds(@config['seeds'])
  @library.save_file(file_name)
end

#  read YAML file
@library.load_file(file_name)

# output library statistic
stata_output