require 'spec_helper'

RSpec.describe SeedHelper do

  let(:library) { Library.new }

  describe 'library have initialized attributes' do
    it { expect(:authors).to be }
    it { expect(:books).to be }
    it { expect(:readers).to be }
    it { expect(:orders).to be }
  end

  before do
    library.create_seeds
  end

  describe 'test seed_authors method' do
    it 'method return array of Authors' do
      expect(library.authors.size).to eq(10)
      expect(library.authors).to be_an_instance_of(Array)
      expect(library.authors.sample).to be_an_instance_of(Author)
    end

    it 'authors have right values' do
      expect(library.authors.sample.name).to be
      expect(library.authors.sample.biography).to be
      expect(library.authors.sample.name).to be_an_instance_of(String)
      expect(library.authors.sample.biography).to be_an_instance_of(String)
    end
  end

  describe 'test seed_books method' do
    it 'method return array of Books' do
      expect(library.books).to be_an_instance_of(Array)
      expect(library.books.sample).to be_an_instance_of(Book)
    end

    it 'books have right values' do
      expect(library.books.sample.title).to be
      expect(library.books.sample.title).to be_an_instance_of(String)
      expect(library.books.sample.author).to be_an_instance_of(Author)
    end

    it 'library.book.author have equal object in library.authors' do
      expect(library.authors.include?(library.books.sample.author)).to be true
    end
  end

  describe 'test seed_readers method' do
    it 'method return array of Readers' do
      expect(library.readers.size).to eq(40)
      expect(library.readers).to be_an_instance_of(Array)
      expect(library.readers.sample).to be_an_instance_of(Reader)
    end

    it 'readers have right values' do
      expect(library.readers.sample.name).to be
      expect(library.readers.sample.email).to be
      expect(library.readers.sample.city).to be
      expect(library.readers.sample.street).to be
      expect(library.readers.sample.house).to be
    end
  end

  describe 'test seed_orders method' do
    it 'method return array of Orders' do
      expect(library.orders.size).to eq(100)
      expect(library.orders).to be_an_instance_of(Array)
      expect(library.orders.sample).to be_an_instance_of(Order)
    end

    it 'library.order have equal objects in library.books and library.readers' do
      expect(library.books.include?(library.orders.sample.book)).to be true
      expect(library.readers.include?(library.orders.sample.reader)).to be true
    end
  end
end
