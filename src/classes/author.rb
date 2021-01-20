class Author
  include Validator
  attr_reader :name, :biography

  def initialize(name, biography)
    validate(name, biography)
    @name = name
    @biography = biography
  end

  protected

  def validate(name, biography)
    validate_presence(name)
    validate_type(String, name)
    validate_type(String, name) if biography
  end
end
