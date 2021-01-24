class WrongTypeError < StandardError
  def initialize
    super('Wrong class of argument!')
  end
end