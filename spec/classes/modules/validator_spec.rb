# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Validator do
  before do
    @author = Author.new('Billy', 'bio')
    @reader = Reader.new('a', 'b', 'c', 'd', 5)
  end

  describe 'test validator' do
    it 'validate_presence validator' do
      expect { @author.validate_presence('nil') }.not_to raise_error
      expect { @author.validate_presence(nil) }.to raise_error(Errors::EmptyValueError)
    end

    it 'validate_type validator' do
      expect { @author.validate_type(String, 'Benny') }.not_to raise_error
      expect { @author.validate_type(String, 59) }.to raise_error(Errors::WrongTypeError)
    end

    it 'validate_positive validator' do
      expect { @reader.validate_positive(5) }.not_to raise_error
      expect { @reader.validate_positive(-100) }.to raise_error(Errors::NonPositiveError)
    end
  end
end
