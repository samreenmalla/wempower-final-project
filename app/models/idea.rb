class Idea < ApplicationRecord
  validates :description, presence: true
  belongs_to :user
  has_many :comments
  acts_as_taggable
end
