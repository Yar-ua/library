class Order
  include Validator
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Time.now.to_date)
    validate(book, reader, date)
    @book = book
    @reader = reader
    @date = date
  end

  protected

  def validate(book, reader, date)
    validate_presence(book, reader, date)
    validate_type(Book, book)
    validate_type(Reader, reader)
    validate_type(Date, date)
  end
end
