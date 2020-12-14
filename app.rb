require_relative './src/classes/library'

require 'faker'
require 'yaml'

# arr = []
# 10.times { arr.push(Faker::Name.name) }

# puts arr

# File.new('data.yaml', 'w')
# File.open('data.yaml', 'w') { |file| file.write(arr.to_yaml) }

# puts 'file writed'

library = Library.new
file_name = "data.yml"

if !File.exist?(file_name)
  ### TODO create seeds
  ### TODO create YAML file
end

### TODO read YAML file

### TODO puts info