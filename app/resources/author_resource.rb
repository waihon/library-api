class AuthorResource < JSONAPI::Resource
  attributes :first, :last
  filters :query

  def self.apply_filter(records, filter, value, options)
    case filter
    when :query
      # `value` is an array. We're interested in its first element.
      records.where({ last: value.first })
    else
      super
    end
  end
end