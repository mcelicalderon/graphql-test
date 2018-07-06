class Mutations::UpdateUser < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :birthday, Types::DateType, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(id: nil, first_name: nil, last_name: nil, email: nil, birthday: nil)
    user = User.find(id)
    if user.update(first_name: first_name, last_name: last_name, email: email, birthday: birthday)
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
