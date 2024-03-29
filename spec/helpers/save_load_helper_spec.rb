require 'spec_helper'

RSpec.describe SaveLoadHelper do

  let(:library) { Library.new }

  before do
    load_config
    library.create_seeds
  end

  it 'Save data to DB' do
    library.save_file(@file_name_test)
    expect(File.exist?(File.expand_path(@file_name_test, 'db'))).to be true
    expect(File.open(File.expand_path(@file_name_test, 'db'), 'r').read).to eq(library.to_yaml)
  end

  describe 'Load data from DB' do
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
    @file_name_test = YAML.load_file(File.expand_path('../support/config_test.yml', __dir__))['data_filename']
  end

  after :all do
    load_config
    File.delete(File.expand_path(@file_name_test, 'db'))
  end
end
