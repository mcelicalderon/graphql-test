class Mutations::UpdateUser < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :birthday, Types::DateType, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(attrs = {})
    user = User.find(attrs[:id])
    if user.update(attrs)
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
