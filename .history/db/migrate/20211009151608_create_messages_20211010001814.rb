class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.reference :user
      t.reference :talk
      t.string :content

      t.timestamps
    end
    #add_index 後で検証して追加
  end
end
