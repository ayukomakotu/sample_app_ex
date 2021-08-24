class AddInReplyToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :in_reply_to, :integer, array: true
  end
end
