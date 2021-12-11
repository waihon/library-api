class AuthorResource < JSONAPI::Resource
  attributes :first, :last, :username
  has_many :books

  before_update :authorize_edit
  before_remove :authorize_edit

  filters :query

  def authorize_edit
    raise ForbiddenError if @model.user_id != context[:current_user].id
  end

  def username
    @model.user.username
  end

  def self.records(options = {})
    # Eager load users
    super.includes(:user)
  end

  before_save do
    # Auto set the user of a new record to the current logged in user
    @model.user_id = context[:current_user].id if @model.new_record?
  end

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