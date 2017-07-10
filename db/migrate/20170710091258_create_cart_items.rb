class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.string :cart_id
      t.string :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
