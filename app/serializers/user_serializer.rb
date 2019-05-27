class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role

  has_many :assessments
end
