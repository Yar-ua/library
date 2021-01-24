class Author
  include ValidationHelper
  attr_reader :name, :biography

  def initialize(name, biography)
    validate(name, biography)
    @name = name
    @biography = biography
  end

  private

  def validate(name, biography)
    validate_presence(name)
    validate_type(String, name)
    validate_type(String, name) if biography
  end
end
