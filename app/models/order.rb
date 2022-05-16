class Order < ApplicationRecord
  belongs_to :customer
	has_many   :order_details, dependent: :destroy
	enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }
	enum payment: { "クレジットカード": 0, "銀行振込": 1 }

  after_update do
    if self.status == "入金確認"
      self.order_details.each {|order_detail|
      order_detail.update(making_status: "製作待ち")
      }
    end
  end
end
