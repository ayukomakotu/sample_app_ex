class Talk < ApplicationRecord
    has_many :messages
    has_many :memberships
    
                           through: :memberships,
                        　  source: :user
end
