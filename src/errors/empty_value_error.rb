class EmptyValueError < StandardError
  def initialize
    super('Empty parameter!')
  end
end
