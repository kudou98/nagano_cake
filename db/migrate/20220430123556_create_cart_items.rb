class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, 	null: false, default: "" # 商品のID
      t.integer :customer_id, null: false, default: "" # 会員のID
      t.integer :amount,	null: false, default: "" #数量
      
      t.timestamps
    end
  end
end
