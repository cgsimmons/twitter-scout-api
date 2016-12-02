# Model for scheduled tweets
class ScheduledTweet < ApplicationRecord
  belongs_to :user
  validates :date_to_post, presence: true
  validate :date_to_post_cannot_be_in_the_past
  validates :body,
            length: { maximum: 140,
                      too_long: '%{count} characters is the maximum allowed' }

  def date_to_post_cannot_be_in_the_past
    return if date_to_post.present? && date_to_post > Date.today
    errors.add(:date_to_post, 'can\'t be in the past')
  end
end
