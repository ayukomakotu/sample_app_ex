class RemoveInReplyToFromMicroposts < ActiveRecord::Migration[6.1]
  def change
    remove_column :microposts, :in_reply_to, :integer
  end
end
