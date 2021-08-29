class Micropost < ApplicationRecord
  belongs_to       :user
  # default: foreign_key: user_id
  has_many         :replies, dependent: :destroy
  has_one_attached :image
  default_scope -> { self.order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140}
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }
  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end

  def detect_reply_names
    self.content.scan(/@[0-9a-z\s][^\n\r]{,50}/i).map{
        |name|name.delete("@")
      }
  end

  def save_reply_user(reply_names)
    reply_names.each do |reply_name|
      reply_user = User.find_by(name: reply_name)
      if reply_user 
        self.replies.create!(in_reply_to: reply_user.id)
      end
    end
  end
end
