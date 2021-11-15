class AuthorResource < JSONAPI::Resource
  attributes :first, :last
  filters :query

  def self.apply_filter(records, filter, value, options)
    case filter
    when :query
      # `value` is an array. We're interested in its first element.
      records.where("last LIKE ?", "%#{value.first}%")
        .or(records.where("first LIKE ?", "%#{value.first}%"))
    else
      super
    end
  end
end