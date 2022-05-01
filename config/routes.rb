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


# customer 顧客用
end
