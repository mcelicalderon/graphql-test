class Types::QueryType < Types::BaseObject
  description 'The query root of this schema'

  field :user, Types::UserType, null: true do
    description 'Find a user by ID'
    argument :id, ID, required: true
  end

  def user(id:)
    User.find(id)
  end
end
