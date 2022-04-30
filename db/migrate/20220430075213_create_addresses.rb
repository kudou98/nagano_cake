class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id,   null: false, default: ""
      # 外部キー 会員のID
      t.string  :name,     null: false, default: "" #宛名
      t.string  :postal_code,     null: false, default: "" #郵便番号
      t.string  :address,       null: false, default: "" #住所

      t.timestamps
    end
  end
end
