class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer  :item_id,       null: false, default: "" #商品ID
      t.integer  :order_id,      null: false, default: "" #注文ID
      t.integer  :price,         null: false, default: "" #購入時価格(税込)
      t.integer  :amount,        null: false, default: "" #数量
      t.integer  :making_status, null: false, default: 0  #制作ステータス
      # e num設定 ０= 着手不可、１= 製作待ち、２= 製作中、３= 製作完了 初期値は0(着手不可)
      
      t.timestamps
    end
  end
end
