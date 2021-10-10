class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.reference :user
      t.reference :talk

      t.timestamps
    end
  end
end
