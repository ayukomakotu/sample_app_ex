class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.reference :user, null: false, foreign_key: true
      t.reference :talk, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
    #add_index 後で検証して追加
  end
end
