class AddFollowNotifyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :follow_notify, :boolean
  end
end
