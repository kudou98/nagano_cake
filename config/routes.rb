Rails.application.routes.draw do
 
  devise_for :admins
  devise_for :customers
end
