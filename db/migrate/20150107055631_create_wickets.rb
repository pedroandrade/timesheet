class CreateWickets < ActiveRecord::Migration
  def change
    create_table :wickets do |t|
      t.string :name
      t.integer :part_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
