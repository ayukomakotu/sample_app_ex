class Reply < ApplicationRecord
    belongs_to :micropost, dependent: :destroy
end
