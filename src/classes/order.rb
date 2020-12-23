# frozen_string_literal: true

# Description/Explanation of Order class
class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    @book = book
    @reader = reader
    @date = date
  end
end
