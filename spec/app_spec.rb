require 'spec_helper'

RSpec.describe App do

  let(:app) { App.new(load_config) }

  before { app.load_data }

  it 'Test loads config' do
    expect(app.config).to eq(load_config)
    expect(app.library).to be_instance_of(Library)
  end

  it 'test load data' do
    lib = YAML.load_file("./db/#{app.config['data_filename']}")
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
    YAML.load_file(File.expand_path('../spec/support/config_test.yml', __dir__))
  end

  after { File.delete(File.expand_path("../db/test_lib_data.yaml", __dir__)) }
end
