class NonPositiveError < StandardError
  def initialize
    super('Parameter is not positive!')
  end
end