class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    belongs_to :idea

    validates :text, :user_id, :post_id, presence: true
    validates :text, :user_id, :idea_id, presence: true
end
