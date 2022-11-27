class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.belongs_to :menu, null: false, foreign_key: { on_delete: :restrict }
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end

    add_index :dishes, [:menu_id, :name], unique: true
  end
end
