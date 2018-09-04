class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  validates :photo, :caption, :user_id, presence: true
  mount_uploader :photo, PhotoUploader
end