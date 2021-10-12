class Talk < ApplicationRecord
    has_many :messages
    has_many :memberships
    has_many :member, through: :memberships
                       source: :user
end
