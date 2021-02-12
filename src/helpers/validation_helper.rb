module ValidationHelper

  def validate_presence(*args)
    raise EmptyValueError if args.any?(&:nil?)
  end

  def validate_type(type, *args)
    args.each { |item| raise WrongTypeError unless item.instance_of?(type) }
  end

  def validate_positive(*args)
    args.each { |item| raise NonPositiveError unless item.positive? }
  end
end
