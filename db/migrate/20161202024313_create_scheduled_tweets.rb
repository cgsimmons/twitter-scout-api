class CreateScheduledTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :scheduled_tweets do |t|
      t.string :body
      t.string :url
      t.datetime :date_to_post
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
