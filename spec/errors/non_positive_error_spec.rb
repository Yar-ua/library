require 'spec_helper'

RSpec.describe NonPositiveError do
  it 'raise NonPositiveError if home value is not positive' do
    expect { Reader.new('a', 'b', 'c', 'd', -5) }.to raise_error(
      NonPositiveError, 'Parameter is not positive!'
    )
  end
end
