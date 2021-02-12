require 'spec_helper'

RSpec.describe Book do
  let(:author) { Author.new(name, bio) }
  let(:name) { 'Lance Vance' }
  let(:bio) { 'Test Bio' }
  let(:book) { Book.new(title, author) }
  let(:title) { 'My fake book' }

  describe 'Book after initialize must be valid with valid attributes' do
    it { expect(:title).to be }
    it { expect(:author).to be }
    it { expect(book.title).to eq('My fake book') }
    it { expect(book).to be }
    it { expect(book).to be_an_instance_of(Book) }
    it { expect(book.author).to be_an_instance_of(Author) }
  end

  describe 'test validation' do
    it 'with empty title or author' do
      expect { Book.new(nil, author) }.to raise_error(EmptyValueError, 'Empty parameter!')
      expect { Book.new(nil, nil) }.to raise_error(EmptyValueError, 'Empty parameter!')
      expect { Book.new(nil, nil) }.to raise_error(EmptyValueError, 'Empty parameter!')
    end

    it 'with wrong title type' do
      expect { Book.new(555, author) }.to raise_error(WrongTypeError, 'Wrong class of argument!')
    end

    it 'with wrong author type' do
      expect { Book.new('title', [hash: author]) }.to raise_error(WrongTypeError, 'Wrong class of argument!')
    end

    it 'with correct parameters' do
      expect { book }.not_to raise_error
      expect(book.author).to eq(author)
    end
  end
end
