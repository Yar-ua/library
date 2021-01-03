# frozen_string_literal: true

# @config value was initialized in loader.rb file
require_relative './src/loader'

def prepare_seeds(conf)
  @library.seed_authors(conf['authors'])
  @library.seed_books(conf['books'])
  @library.seed_readers(conf['readers'])
  @library.seed_orders(conf['orders'])
end

def stata_output(conf)
  puts '====='
  puts "Top readers: #{@library.top_reader(conf['top_readers']).join(' || ')}"
  puts '====='
  puts "Top of the most popular books: #{@library.most_popular_books(conf['top_books']).join(' || ')}"
  puts '====='
  puts "Quantity of readers of the most popular books: #{@library.readers_of_popular_books(conf['readers_qty'])}"
end

@library = Library.new
file_name = @config['data_filename']

unless File.exist?(file_name)
  prepare_seeds(@config['seeds'])
  @library.create(file_name)
end

if File.exist?(file_name)
  @library.read(file_name)
else
  puts 'Cannot load data - no data file'
end

stata_output(@config['output'])
