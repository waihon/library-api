class BookResource < JSONAPI::Resource
  # We have to specify the attributes by hand as the jsonapi:resource generator
  # doesn't allow us to specify attributes.
  attributes :title, :isbn, :publish_date, :username
  # Please note JSONAPI::Resource uses has_one instead of belongs_to
  has_one :author
  has_many :reviews

  def username
    @model.user.username
  end

  def self.records(options = {})
    # Eager load users
    super.includes(:user)
  end

  filters :query

  before_save do
    # Auto set the user of a new record to the current logged in user
    @model.user_id = context[:current_user].id if @model.new_record?
  end

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
