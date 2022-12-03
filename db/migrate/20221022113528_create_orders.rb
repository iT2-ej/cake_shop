class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :shipping_postal, null: false
      t.text :shipping_address, null: false
      t.string :shipping_name, null: false
      t.integer :postage, default: 800, null: false
      t.integer :payment_method, null: false
      t.integer :billing_amount, null: false
      t.integer :order_status, null: false
      t.timestamps
    end
  end
end
