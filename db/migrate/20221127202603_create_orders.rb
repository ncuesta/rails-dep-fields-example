class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.belongs_to :dish, null: false, foreign_key: { on_delete: :restrict }
      t.text :comments

      t.timestamps
    end
  end
end
