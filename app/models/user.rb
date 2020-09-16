class User < ApplicationRecord
  has_one_attached :avatar
  has_many :shopping_carts, dependent: :destroy
  has_many :reviews, dependent: :nullify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :company, dependent: :destroy
  has_many :products, through: :companies
  has_many :guests, through: :bookings
  has_many :notifications, dependent: :destroy

  def has_unread_notifications?
    notifications.where(read: false).count > 0
  end

  def unread_notifications_count
    notifications.where(read: false).count
  end
end
