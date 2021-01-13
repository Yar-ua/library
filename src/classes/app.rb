class App
  attr_reader :library, :config

  def initialize(config)
    @config = config
    @library = Library.new
    @file_name = @config['data_filename']
  end

  def load_data
    unless File.exist?(@file_name)
      @library.create_seeds
      @library.save_file(@file_name)
    end

    if File.exist?(@file_name)
      @library.load_db(@file_name)
    else
      puts 'Cannot load data - no data file'
    end
  end

  def output
    stata_output(@config['output'])
  end

  protected

  def stata_output(conf)
    puts '====='
    puts "Top readers: #{@library.top_reader(conf['top_readers']).join(' || ')}"
    puts '====='
    puts "Top of the most popular books: #{@library.most_popular_books(conf['top_books']).join(' || ')}"
    puts '====='
    puts "Quantity of readers of the most popular books: #{@library.readers_of_popular_books(conf['readers_qty'])}"
  end
end
