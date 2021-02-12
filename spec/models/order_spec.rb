require 'spec_helper'

RSpec.describe Order do
  let(:author) { Author.new('Tom Sawyer', 'Test Bio') }
  let(:book) { Book.new("Tom's fake book", author) }
  let(:reader) { Reader.new('Gilly', 'g@mail.com', 'Rome', 'Cool Ave', 60) }
  let(:order) { Order.new(book, reader) }

  describe 'Reader after initialize must be valid with valid attributes' do
    it { expect(:book).to be }
    it { expect(:reader).to be }
    it { expect(:date).to be }
    it { expect(order).to be_an_instance_of(Order) }
    it { expect(order.book).to be_an_instance_of(Book) }
    it { expect(order.reader).to be_an_instance_of(Reader) }
  end

  describe 'test validation' do
    it 'with empty attributes' do
      expect { Order.new(nil, reader) }.to raise_error(EmptyValueError, 'Empty parameter!')
      expect { Order.new(book, nil) }.to raise_error(EmptyValueError, 'Empty parameter!')
    end

    it 'with wrong class of attributes' do
      expect { Order.new(reader, book) }.to raise_error(WrongTypeError, 'Wrong class of argument!')
      expect { Order.new(book, book, reader) }.to raise_error(WrongTypeError, 'Wrong class of argument!')
      expect do
        Order.new(book, reader, 'string date')
      end.to raise_error(WrongTypeError, 'Wrong class of argument!')
      expect { Order.new('book', 'reader') }.to raise_error(WrongTypeError, 'Wrong class of argument!')
    end

    describe 'with correct parameters' do
      it { expect { order }.not_to raise_error }
      it { expect(order.book).to eq(book) }
      it { expect(order.reader).to eq(reader) }
    end
  end
end
