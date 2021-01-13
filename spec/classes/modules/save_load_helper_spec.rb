require 'spec_helper'

RSpec.describe SaveLoadHelper do

  let(:library) { Library.new }

  before do
    load_config
    library.create_seeds
  end

  it 'Test save method' do
    library.save_file(@file_name_test)
    expect(File.exist?(@file_name_test)).to be true
    expect(File.open(@file_name_test, 'r').read).to eq(library.to_yaml)
  end

  describe 'Test load method' do
    before :each do
      load_config
      library.load_db(@file_name_test)
    end

    it { expect(library).to be }
    it { expect(library.authors.sample).to be_an_instance_of(Author) }
    it { expect(library.books.sample).to be_an_instance_of(Book) }
    it { expect(library.orders.sample).to be_an_instance_of(Order) }
    it { expect(library.readers.sample).to be_an_instance_of(Reader) }
  end

  def load_config
    @file_name_test = YAML.load_file(File.expand_path('../../../config/config_test.yml', __dir__))['data_filename']
  end

  after :all do
    load_config
    File.delete(File.expand_path(File.join('../../..', @file_name_test), __dir__))
  end
end
