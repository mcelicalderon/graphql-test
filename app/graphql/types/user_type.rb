class Types::UserType < Types::BaseObject
  description 'A user'
  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :email, String, null: false
end
