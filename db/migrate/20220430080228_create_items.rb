class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer  :genre_id,    index: true, null: false, default: ""
      # 外部キー 商品ジャンルのID
      t.string   :image_id
      t.string   :name,        null: false, default: "" #商品名
      t.text     :introduction #商品説明文
      t.integer  :price,       null: false, default: "" #税抜価格
      t.boolean  :is_active,   null: false, default: 1  #販売ステータス
      # e_num設定 ０ = 販売可、１ = 販売不可　登録時は販売不可

      t.timestamps
    end
  end
end
