# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Library do
  before do
    load_config
    @library = Library.new
    @library.seed_authors(5)
    @library.seed_books(3)
    @library.seed_readers(20)
    @library.seed_orders(80)
  end

  describe 'Test library' do
    describe 'Reader after initialize must be valid with valid attributes' do
      it { expect(:authors).to be }
      it { expect(:books).to be }
      it { expect(:readers).to be }
      it { expect(:orders).to be }
      it { expect(@library.authors.size).to eq(5) }
      it { expect(@library.books.size).to be <= (5 * 3) }
      it { expect(@library.readers.size).to eq(20) }
      it { expect(@library.orders.size).to eq(80) }
      it { expect(@library.authors.sample).to be_an_instance_of(Author) }
      it { expect(@library.books.sample).to be_an_instance_of(Book) }
      it { expect(@library.readers.sample).to be_an_instance_of(Reader) }
      it { expect(@library.orders.sample).to be_an_instance_of(Order) }
    end

    it 'Test create method' do
      @library.create(@file_name_test)
      expect(File.exist?(@file_name_test)).to be true
      expect(File.open(@file_name_test, 'r').read).to eq(@library.to_yaml)
    end
  end

  describe 'Test read method' do
    before :each do
      load_config
      @library = Library.new
      @library.read(@file_name_test)
    end

    it { expect(@library).to be }
    it { expect(@library.authors.sample).to be_an_instance_of(Author) }
    it { expect(@library.books.sample).to be_an_instance_of(Book) }
    it { expect(@library.orders.sample).to be_an_instance_of(Order) }
    it { expect(@library.readers.sample).to be_an_instance_of(Reader) }

    it 'Test top_reader method' do
      10.times { @library.orders << Order.new(@library.books[0], @library.readers[0]) }
      expect(@library.top_reader).to eq(Array(@library.readers[0].name))
      expect(@library.top_reader.size).to eq(1)
      expect(@library.top_reader(10).size).to eq(10)
    end

    it 'Test most_popular_books method' do
      30.times { @library.orders << Order.new(@library.books[2], @library.readers.sample) }
      25.times { @library.orders << Order.new(@library.books[3], @library.readers.sample) }
      expect(@library.most_popular_books.size).to eq(1)
      expect(@library.most_popular_books(2).size).to eq(2)
      expect(@library.most_popular_books).to eq(Array(@library.books[2].title))
      expect(@library.most_popular_books(2)).to eq([@library.books[2].title, @library.books[3].title])
    end
  end

  def load_config
    @file_name_test = YAML.load_file(File.expand_path('../../config/config.yml', __dir__))['data_filename_test']
  end

  after :all do
    load_config
    File.delete(File.expand_path(File.join('../../', @file_name_test), __dir__))
  end
end
