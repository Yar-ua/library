module Errors
  class EmptyValueError < StandardError
    def initialize
      super('Empty parameter!')
    end
  end

  class WrongTypeError < StandardError
    def initialize
      super('Wrong class of argument!')
    end
  end

  class NonPositiveError < StandardError
    def initialize
      super('Parameter is not positive!')
    end
  end
end
