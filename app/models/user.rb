class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :ideas
  has_many :comments
  has_many :chat_rooms, dependent: :destroy   
  has_many :messages, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  def name
    email.split('@')[0]
  end
end
