class CreateShipAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :ship_addresses do |t|
      t.integer :customer_id,   null: false, default: ""
      # 外部キー 会員のID
      t.string  :last_name,     null: false, default: ""
      t.string  :first_name,    null: false, default: ""
      t.string  :postal_code,     null: false, default: "" #郵便番号
      t.string  :address,       null: false, default: "" #住所

      t.timestamps
    end
  end
end
