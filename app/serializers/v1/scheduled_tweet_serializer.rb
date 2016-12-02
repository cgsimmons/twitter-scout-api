class V1::ScheduledTweetSerializer < ActiveModel::Serializer

  attributes :body, :date_to_post, :url
  has_one :user, serializer: V1::UserSerializer

  def abstract
    object.body[0..140]
  end

end`
