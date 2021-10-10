class Message < ApplicationRecord
    validates :user_id, presence: true
    validates :talk_id, presence: true
    belongs_to :user
    belongs_to :talk
end
