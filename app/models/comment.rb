class Comment < ApplicationRecord
    validates :title , presence: true
    belongs_to :commentable, :polymorphic => true
end
