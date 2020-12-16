require_relative './src/classes/library'
require 'faker'
require 'yaml'

library = Library.new
file_name = "lib_data.yaml"

if !File.exist?(file_name)
  library.seed_authors(10)
  library.seed_books(3)
  library.seed_readers(40)
  library.seed_orders(150)
  
  print "\ncreating data YAML file..."
  File.new('lib_data.yaml', 'w')
  File.open('lib_data.yaml', 'w') { |file| file.write(library.to_yaml) }
  puts 'file created'
end

# puts library.inspect

### TODO read YAML file

### TODO puts info  
  
  
  
  
  
