class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|

      t.timestamps
    end
    add_index :talks, :updated_at
    #更新順に表示したいから
  end
end
