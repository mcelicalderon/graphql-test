class Mutations::CreateUser < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :birthday, Types::DateType, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(attrs = {})
    user = User.new(attrs)
    if user.save
      {
        user: user,
        errors: []
      }
    else
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end
