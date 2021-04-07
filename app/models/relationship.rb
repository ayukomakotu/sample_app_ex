class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # 規約　デフォルト　モデル名_id => ✖️ followed_id  <-> followed
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
