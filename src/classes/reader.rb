# frozen_string_literal: true

# Description/Explanation of Reader class
class Reader
  include Validator
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    validate(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  protected

  def validate(name, email, city, street, house)
    validate_presence(name, email, city, street, house)
    validate_type(String, name, email, city, street)
    validate_type(Integer, house)
    validate_positive(house)
  end
end
