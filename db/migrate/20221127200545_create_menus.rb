class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.belongs_to :restaurant, null: false, foreign_key: { on_delete: :restrict }
      t.integer :day, null: false

      t.timestamps
    end
    add_index :menus, [:restaurant_id, :day], unique: true
  end
end
