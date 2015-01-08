class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :product, index: true
      t.belongs_to :order, index: true
      t.decimal :const_price
      t.decimal :subtotal_price
      t.integer :number

      t.timestamps null: false
    end
    add_foreign_key :order_items, :products
    add_foreign_key :order_items, :orders
  end
end