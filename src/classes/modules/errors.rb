# frozen_string_literal: true

# Description/Explanation of Errors module
module Errors
  # Description/Explanation of EmptyValueError
  class EmptyValueError < StandardError
    def initialize
      super('Empty parameter!')
    end
  end

  # Description/Explanation of EmptyValueError
  class WrongTypeError < StandardError
    def initialize
      super('Wrong class of argument!')
    end
  end

  # Description/Explanation of EmptyValueError
  class NonPositiveError < StandardError
    def initialize
      super('Parameter is not positive!')
    end
  end
end
