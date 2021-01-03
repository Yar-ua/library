# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Errors do
  # Test EmptyValueError
  it 'raise EmptyValueError if some wrong' do
    expect { Author.new(nil, 'bio') }.to raise_error(Errors::EmptyValueError, 'Empty parameter!')
  end

  # Test WrongTypeError
  it 'raise WrongTypeError if some wrong' do
    expect { Author.new(354, 'bio') }.to raise_error(Errors::WrongTypeError, 'Wrong class of argument!')
  end

  # Test NonPositiveError
  it 'raise NonPositiveError if home value is not positive' do
    expect { Reader.new('a', 'b', 'c', 'd', -5) }.to raise_error(
      Errors::NonPositiveError, 'Parameter is not positive!'
    )
  end
end
