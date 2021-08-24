class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.integer :in_reply_to

      t.timestamps
    end
  end
end
