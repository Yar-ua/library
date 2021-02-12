require 'spec_helper'

RSpec.describe Library do

  let(:library) { Library.new }

  before do
    load_config
    library.create_seeds
    library.save_file(@file_name_test)
  end

  describe 'Test library' do
    describe 'Reader after initialize must be valid with valid attributes' do
      it { expect(:authors).to be }
      it { expect(:books).to be }
      it { expect(:readers).to be }
      it { expect(:orders).to be }
      it { expect(library.authors.size).to eq(10) }
      it { expect(library.books.size).to be <= (10 * 3) }
      it { expect(library.readers.size).to eq(40) }
      it { expect(library.orders.size).to eq(100) }
      it { expect(library.authors.sample).to be_an_instance_of(Author) }
      it { expect(library.books.sample).to be_an_instance_of(Book) }
      it { expect(library.readers.sample).to be_an_instance_of(Reader) }
      it { expect(library.orders.sample).to be_an_instance_of(Order) }
    end
  end

  describe 'Test load method' do
    before :each do
      load_config
      library.load_db(@file_name_test)
    end

    it 'Test top_reader method' do
      10.times { library.orders << Order.new(library.books[0], library.readers[0]) }
      expect(library.top_reader).to eq(Array(library.readers[0].name))
      expect(library.top_reader.size).to eq(1)
      expect(library.top_reader(10).size).to eq(10)
    end

    it 'Test most_popular_books method' do
      60.times { library.orders << Order.new(library.books[2], library.readers.sample) }
      45.times { library.orders << Order.new(library.books[3], library.readers.sample) }
      expect(library.most_popular_books.size).to eq(1)
      expect(library.most_popular_books(2).size).to eq(2)
      expect(library.most_popular_books).to eq(Array(library.books[2].title))
      expect(library.most_popular_books(2)).to eq([library.books[2].title, library.books[3].title])
    end
  end

  def load_config
    @file_name_test = YAML.load_file(File.expand_path('../../spec/support/config_test.yml', __dir__))['data_filename']
  end

  after :all do
    load_config
    File.delete(File.expand_path(@file_name_test, 'db'))
  end
end
