module V1
  # Class for tweets that users create in advance for
  # scheduled posting
  class ScheduledTweetsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]

    def index
      @scheduled_tweets = ScheduledTweet
                          .includes(:user)
                          .order(date_to_post: :asc).all
      render json: @scheduled_tweets, each_serializer: ScheduledTweetSerializer
    end

    def show
      @scheduled_tweet = ScheduledTweet.find(params[:id])
      render json: @scheduled_tweet, serializer: ScheduledTweetSerializer
    end

    def create
      @scheduled_tweet = ScheduledTweet.new scheduled_tweet_params

      if @scheduled_tweet.save
        render json: @scheduled_tweet, serializer: ScheduledTweetSerializer
      else
        render json: { error: t('scheduled_tweet_error') },
               status: :unprocessable_entity
      end
    end

    def scheduled_tweet_params
      params.require(:scheduled_tweet)
            .permit(:body, :date_to_post, :url)
            .merge(user: current_user)
    end
  end
end
