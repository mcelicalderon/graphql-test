class Types::DateType < GraphQL::Schema::Scalar
  description 'Valid Date'

  def self.coerce_input(value, _context)
    Date.parse(value)
  rescue ArgumentError
    raise GraphQL::CoercionError, "#{value.inspect} is not a valid Date"
  end

  def self.coerce_result(value, context)
    value.iso8601
  end
end
