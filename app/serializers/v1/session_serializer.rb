module V1
  # Class to serialize session data
  class SessionSerializer < ActiveModel::Serializer
    attributes :email, :token_type, :user_id, :api_key

    def user_id
      object.id
    end

    def token_type
      'Bearer'
    end
  end
end
