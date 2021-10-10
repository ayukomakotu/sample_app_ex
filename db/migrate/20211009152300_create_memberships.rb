class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :talk, null: false, foreign_key: true

      t.timestamps
    end
    add_index :memberships, [:user_id, :talk_id], unique: true
    #user_idとtalk_idの組み合わせはuniqueでなければならない
  end
end
