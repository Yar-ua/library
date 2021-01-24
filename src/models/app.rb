class App
  attr_reader :library, :config

  def initialize(config)
    @config = config
    @library = Library.new
    @file_name = @config['data_filename']
  end

  def load_data
    create_and_save_seeds unless File.exist?("./db/#{@file_name}")
    @library.load_db(@file_name)
  end

  def output
    statistic_output(@config['output'])
  end

  private

  def create_and_save_seeds
    @library.create_seeds
    @library.save_file(@file_name)
  end

  def statistic_output(config)
    puts '====='
    puts "Top readers: #{@library.top_reader(config['top_readers']).join(' || ')}"
    puts '====='
    puts "Top of the most popular books: #{@library.most_popular_books(config['top_books']).join(' || ')}"
    puts '====='
    puts "Quantity of readers of the most popular books: #{@library.readers_of_popular_books(config['readers_qty'])}"
  end
end
