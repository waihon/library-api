class AuthorResource < JSONAPI::Resource
  attributes :first, :last
  filters :query

  def self.apply_filter(records, filter, value, options)
    case filter
    when :query
      # `value` is an array. We're interested in its first element.
      name = value.first.downcase
      records.where("LOWER(last) LIKE ?", "%#{name}%")
        .or(records.where("LOWER(first) LIKE ?", "%#{name}%"))
    else
      super
    end
  end
end