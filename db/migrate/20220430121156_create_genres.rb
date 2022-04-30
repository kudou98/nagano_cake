class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string  :name,        null: false, default: "" #ジャンル名

      t.boolean :is_enabled,  default: true, null: false
      # 商品の有効/無効 TRUE =有効 FALSE =無効 初期では無効設定


      t.timestamps
    end
  end
end
