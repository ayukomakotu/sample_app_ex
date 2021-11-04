class Talk < ApplicationRecord
    has_many :messages
    has_many :memberships
    has_many :members,  class_name: "User", 
                           through: :memberships,
                            source: :user
    default_scope -> {order(updated_at: :desc)}
end
