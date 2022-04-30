Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  sessions: 'public/sessions',
  passwords: 'public/passwords',
  registrations: "public/registrations"
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions",
  passwords: 'admin/passwords',
  registrations: 'admin/registrations'
}

end
