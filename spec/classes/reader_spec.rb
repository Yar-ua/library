require 'spec_helper'

RSpec.describe Reader do
  let(:reader) { Reader.new('Sam', 's@mail.com', 'Toronto', 'Elm St.', 51) }

  describe 'Reader after initialize must be valid with valid attributes' do
    it { expect(:name).to be }
    it { expect(:email).to be }
    it { expect(:city).to be }
    it { expect(:street).to be }
    it { expect(:house).to be }
    it { expect(reader).to be_an_instance_of(Reader) }
  end

  describe 'test validation' do
    it 'with empty attributes' do
      expect { Reader.new(nil, 's@mail.com', 'Toronto', 'Elm St.', 51) }.to raise_error(
        Errors::EmptyValueError, 'Empty parameter!'
      )
      expect { Reader.new('Sam', nil, 'Toronto', 'Elm St.', 51) }.to raise_error(
        Errors::EmptyValueError, 'Empty parameter!'
      )
      expect { Reader.new('Sam', 's@mail.com', nil, 'Elm St.', 51) }.to raise_error(
        Errors::EmptyValueError, 'Empty parameter!'
      )
      expect { Reader.new('Sam', 's@mail.com', 'Toronto', nil, 51) }.to raise_error(
        Errors::EmptyValueError, 'Empty parameter!'
      )
      expect { Reader.new('Sam', 's@mail.com', 'Toronto', 'Elm St.', nil) }.to raise_error(
        Errors::EmptyValueError, 'Empty parameter!'
      )
    end

    it 'with wrong String type of argument' do
      expect { Reader.new(777, 's@mail.com', 'Toronto', 'Elm St.', 51) }.to raise_error(
        Errors::WrongTypeError, 'Wrong class of argument!'
      )
      expect { Reader.new('Sam', [email: 's@mail.com'], 'Toronto', 'Elm St.', 51) }.to raise_error(
        Errors::WrongTypeError, 'Wrong class of argument!'
      )
    end

    it 'with wrong Integer type of argument' do
      expect { Reader.new('Sam', 's@mail.com', 'Toronto', 'Elm St.', '51') }.to raise_error(
        Errors::WrongTypeError, 'Wrong class of argument!'
      )
    end

    it 'with wrong not positive house value' do
      expect { Reader.new('Sam', 's@mail.com', 'Toronto', 'Elm St.', -4) }.to raise_error(
        Errors::NonPositiveError, 'Parameter is not positive!'
      )
      expect { Reader.new('Sam', 's@mail.com', 'Toronto', 'Elm St.', 0) }.to raise_error(
        Errors::NonPositiveError, 'Parameter is not positive!'
      )
    end

    describe 'with correct parameters' do
      it { expect { reader }.not_to raise_error }
      it { expect(reader.name).to eq('Sam') }
      it { expect(reader.house).to eq(51) }
    end
  end
end
