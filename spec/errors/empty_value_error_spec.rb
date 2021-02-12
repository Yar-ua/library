require 'spec_helper'

RSpec.describe EmptyValueError do
  it 'raise EmptyValueError if some wrong' do
    expect { Author.new(nil, 'bio') }.to raise_error(EmptyValueError, 'Empty parameter!')
  end
end
