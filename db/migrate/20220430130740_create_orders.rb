class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer  :customer_id,    null: false, default: "" #会員ID
      t.string   :postal_code,    null: false, default: "" #配送先郵便番号
      t.string   :address,        null: false, default: "" #配送先住所
      t.string   :name,           null: false, default: "" #配送先宛名
      t.integer  :shipping_cost,  null: false, default: 800 #送料
      t.integer  :total_payment,  null: false  #支払金額
      t.integer  :payment, null: false, default: "" #支払方法
      t.integer  :status,         null: false, default: 0 #受注ステータス
      # e_num設定 ０= 入金待ち、１= 入金確認、２= 製作中、３= 発送準備中、４= 発送済み 登録時は0(入金待ち)

      t.timestamps
    end
  end
end
