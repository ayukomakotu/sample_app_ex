class Talk < ApplicationRecord
    belongs_to :talks, class_name: "Membership"
end
