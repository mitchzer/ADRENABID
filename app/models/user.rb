class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :wallet, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :address, presence: true

  after_create :create_user_wallet
  after_create :send_welcome_email

  def create_user_wallet
    Wallet.create(user: self)
  end

private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
