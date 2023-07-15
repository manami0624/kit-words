class CreateDictionaries < ActiveRecord::Migration[6.0]
  def change
    create_table :dictionaries do |t|
      t.string :vocabulary,   null: false
      t.string :japanese,     null: false
      t.string :meaning
      t.integer :user_id
      t.timestamps
    end
  end
end
