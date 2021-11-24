class BookResource < JSONAPI::Resource
  # We have to specify the attributes by hand as the jsonapi:resource generator
  # doesn't allow us to specify attributes.
  attributes :title, :isbn, :publish_date
  # Please note JSONAPI::Resource uses has_one instead of belongs_to
  has_one :author
  has_many :reviews

  filters :query

  def self.apply_filter(records, filter, value, options)
    case filter
    when :query
      query_value = value.first.downcase
      records.where("LOWER(title) LIKE ?", "%#{query_value}%")
        .or(records.where("LOWER(isbn) LIKE ?", "%#{query_value}%"))
    else
      super
    end
  end
end
