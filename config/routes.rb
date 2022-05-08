Rails.application.routes.draw do

# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions",
  passwords: 'admin/passwords',
  registrations: 'admin/registrations'
}

# URL /customers/sign_in ...
devise_for :customers, controllers: {
  sessions: 'public/sessions',
  passwords: 'public/passwords',
  registrations: "public/registrations"
}



# admin 管理者用
namespace :admin do
  root 'homes#top'
  resources :customer_datas, only: [:show, :index, :edit, :update]
  resources :items, except: [:destroy]
  resources :genres, except: [:new, :show, :destroy]
  resources :orders, only: [:index, :show]
  get '/customer_datas/:id/orders' => 'orders#index', as: "customer_data_orders" # 会員詳細 => 注文履歴の表示データを変える用
  get '/yesterday/orders' => 'orders#index', as: "yesterday_orders" # TOP,本日製作分の注文数 => 注文履歴の表示データ用
  get '/today/orders' => 'orders#index', as: "today_orders" # TOP,本日受注した注文数 => 注文履歴の表示データ用
  patch '/orders/:id/status' => 'orders#status_update', as: "status" # 注文ステータスupdate
  patch '/orders/:id/making_status' => 'orders#making_status_update', as: "making_status" # 製作ステータスupdate
end

# customer 顧客用
end
