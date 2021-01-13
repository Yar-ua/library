class Author
  include Validator
  attr_reader :name, :biography

  def initialize(name, biography)
    validate(name)
    @name = name
    @biography = biography
  end

  protected

  def validate(name)
    validate_presence(name)
    validate_type(String, name)
  end
end
