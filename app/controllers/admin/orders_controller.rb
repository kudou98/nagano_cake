class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:id] # 会員詳細から来た場合
      @orders = Customer.find(params[:id]).orders.page(params[:page]).per(10)

    elsif request.fullpath.include? "today" # TOP本日受注分から来た場合
      @orders = Order.where(created_at:  Time.zone.now.all_day).page(params[:page]).per(10)

    elsif request.fullpath.include? "yesterday" # TOP本日製作分から来た場合
      @orders = Order.where(created_at: 1.day.ago.all_day).page(params[:page]).per(10)

    else
      @orders = Order.page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @items_total_payment = calculate(@order)
  end

  def calculate(items_total_payment) # 商品合計を算出するメソッド
    @items_total_payment = 0
    @order_details.each {|order_detail|
    tax_in_price = (order_detail.price * 1.1).floor
    sub_total_price = tax_in_price * order_detail.amount
    @items_total_payment += sub_total_price
    }
    return @items_total_payment
  end

  def order_status_update
    @order = Order.find(params[:id]) #注文詳細の特定
    @order_items = @order.order_items #注文から紐付く商品の取得
    order.update(order_params)
    # OrderModel after_update => 製作ステータスの自動変更

     if @order.status == "入金確認" #注文ステータスが入金確認なら下の事をする
	      @order_items.update_all(making_status: 1) #製作ステータスを「製作待ちに」　更新
	      end
    redirect_to admin_order_path(@order)
  end

  def making_status_update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    # OrderDetailModel after_update => 注文ステータスの自動更新
    redirect_to admin_order_path(order_detail.order_id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
