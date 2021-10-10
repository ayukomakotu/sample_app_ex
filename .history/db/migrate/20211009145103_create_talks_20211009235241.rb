class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|

      t.timestamps
    end
    #indexが必要？　:talks :updated_at?
  end
end
