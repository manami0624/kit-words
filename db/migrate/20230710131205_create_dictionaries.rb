class CreateDictionaries < ActiveRecord::Migration[6.0]
  def change
    create_table :dictionaries do |t|
      t.string :vocabulary,   null: false
      t.string :meaning,      null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
