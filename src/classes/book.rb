# frozen_string_literal: true

# Description/Explanation of Book class
class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end
end
