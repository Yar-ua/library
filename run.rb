# @config value was initialized in loader.rb file
require_relative './src/loader'

app = App.new(YAML.load_file('./config/config.yml'))
app.load_data
app.output
