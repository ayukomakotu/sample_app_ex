class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :talk, null: false, foreign_key: true

      t.timestamps
    end
    add_index :memeberships, [:user_id, :talk_id], unique: true
  end
end