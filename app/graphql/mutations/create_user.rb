class Mutations::CreateUser < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :birthday, Types::DateType, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(first_name:, last_name:, email:, birthday: nil)
    user = User.new(first_name: first_name, last_name: last_name, email: email, birthday: birthday)
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
