class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.reference :user
      t.reference :talk
      t.string :content

      t.timestamps
    end
  end
end
