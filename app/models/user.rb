class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :generate_api_key
  has_many :scheduled_tweets, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true


  private
  def generate_api_key
    begin
      self.api_key = SecureRandom.hex(32)
    end while User.exists?(api_key: api_key)
  end

end
