# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Author do
  let(:author) { Author.new('Lance Vance', 'Test Bio') }

  describe 'Author after initialize must be valid with valid attributes' do
    it { expect(:name).to be }
    it { expect(:biography).to be }
    it { expect(author.name).to eq('Lance Vance') }
    it { expect(author.biography).to eq('Test Bio') }
    it { expect(author).to be }
    it { expect(author).to be_an_instance_of(Author) }
  end

  describe 'test validation' do
    it 'with empty name' do
      expect { Author.new(nil, 'Test Bio') }.to raise_error(Errors::EmptyValueError, 'Empty parameter!')
    end

    it 'with wrong name type' do
      expect { Author.new(123, 'Test Bio') }.to raise_error(Errors::WrongTypeError, 'Wrong class of argument!')
    end

    it 'with optional biography' do
      expect { Author.new('test name', nil) }.not_to raise_error
      expect { Author.new('test name', '') }.not_to raise_error
    end

    it 'with correct parameters' do
      expect { Author.new('test name', nil) }.not_to raise_error
    end
  end
end
