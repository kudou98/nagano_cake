class CustomersController < ApplicationController



  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "You have edited user data successfully."
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end


  def withdrow #退会画面を表示するアクション
    @customer = Customer.find(params[:id])
  end

  def switch
    @customer = current_customer
    if @customer.update(is_deleted: false)
      sign_out current_customer #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
    end
      redirect_to root_path
  end




  def check
      @customer = Customer.find(params[:id]) #ユーザーの情報を見つける
  end




  private
  def customer_params
  	  params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :telephone_number, :email, :encrypted_password, :postal_code, :address)
  end


end
