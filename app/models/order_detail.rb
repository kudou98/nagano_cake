class OrderDetail < ApplicationRecord
  belongs_to :order
	enum making_status: { "着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3 }

  after_update do
    order_details = self.order.order_details
    if order_details.any? {|order_detail| order_detail.making_status == "製作中"} == true # 条件分岐：製作ステータスが1つでも製作中にだったら
      self.order.update(status: "製作中") # 注文ステータスを製作中に変更する
    elsif order_details.all? {|order_detail| order_detail.making_status == "製作完了"} == true # 条件分岐：製作ステータスが全て製作完了だったら
    self.order.update(status: "発送準備中") # 注文ステータスを発送準備中に変更する
    end
  end
end
