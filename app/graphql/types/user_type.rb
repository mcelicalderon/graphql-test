class Types::UserType < Types::BaseObject
  description 'A user'
  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :email, String, null: false
  field :birthday, Types::DateType, null: true
  field :test, String, null: true
  field :age, Integer, null: true

  def test
    'TEST STRING HERE!'
  end

  def age
    return if birthday.blank?
    temp = Time.zone.today.year - birthday.year
    temp -= 1 if Time.zone.today < birthday + temp.years
    temp
  end
end
