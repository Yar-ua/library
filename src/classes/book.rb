# frozen_string_literal: true

# Description/Explanation of Book class
class Book
  include Validator
  attr_reader :title, :author

  def initialize(title, author)
    validate(title, author)
    @title = title
    @author = author
  end

  protected

  def validate(title, author)
    validate_presence(title, author)
    validate_type(String, title)
    validate_type(Author, author)
  end
end
