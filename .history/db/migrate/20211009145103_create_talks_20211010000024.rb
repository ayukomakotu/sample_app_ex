class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|

      t.timestamps
    end
    add_index :talks, [:id, :updated_at]
  end
end
