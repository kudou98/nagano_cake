class Order < ApplicationRecord
  belongs_to :customer
	has_many   :order_details, dependent: :destroy
	enum status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]
	enum payment: [:クレジットカード, :銀行振込]

  after_update do
    if self.status == "入金確認"
      self.order_details.each {|order_detail|
      order_detail.update(making_status: "製作待ち")
      }
    end
  end
end
