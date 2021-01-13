require 'spec_helper'

RSpec.describe App do

  let(:app) { App.new(load_config) }

  it 'Test app initialization' do
    expect(app.config).to eq(load_config)
    expect(app.library).to be_instance_of(Library)
  end

  before :each do
    app.load_data
  end

  it 'test load data' do
    lib = YAML.load_file("./#{app.config['data_filename']}")
    expect(app.library.authors.last.name).to eq(lib.authors.last.name)
    expect(app.library.orders.first.reader.name).to eq(lib.orders.first.reader.name)
    expect(app.library.books.last.title).to eq(lib.books.last.title)
  end

  it 'test output' do
    top_reader = app.library.top_reader(app.config['output']['top_readers']).join(' || ')
    top_books = app.library.most_popular_books(app.config['output']['top_books']).join(' || ')
    readers_qty = app.library.readers_of_popular_books(app.config['output']['readers_qty'])
    expect { app.output }.to output(include 'Top readers:').to_stdout
    expect { app.output }.to output(include 'Top of the most popular books:').to_stdout
    expect { app.output }.to output(include 'Quantity of readers of the most popular books:').to_stdout
    expect { app.output }.to output(include top_reader).to_stdout
    expect { app.output }.to output(include top_books).to_stdout
    expect { app.output }.to output(include readers_qty.to_s).to_stdout
  end

  def load_config
    # in this tests used special configuration for test cases, described in config_test.yml file
    YAML.load_file(File.expand_path('../config/config_test.yml', __dir__))
  end

  after :all do
    File.delete(File.expand_path("../test_lib_data.yaml", __dir__))
  end
end
