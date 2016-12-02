module V1
  # class to serialize user data
  class UserSerializer < ActiveModel::Serializer
    attributes :username
  end
end
