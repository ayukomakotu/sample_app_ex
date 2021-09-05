class AddInReplyToToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :in_reply_to, :boolean, default: false
  end
end
