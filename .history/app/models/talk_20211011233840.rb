class Talk < ApplicationRecord
    has_many :messages
    has_many :memberships
    has_many :members, through: :memberships,
                       source: :user
end
