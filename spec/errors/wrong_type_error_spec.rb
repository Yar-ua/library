require 'spec_helper'

RSpec.describe WrongTypeError do
  it 'raise WrongTypeError if some wrong' do
    expect { Author.new(354, 'bio') }.to raise_error(WrongTypeError, 'Wrong class of argument!')
  end
end
