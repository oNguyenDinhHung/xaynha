Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vat_lieus, :nha_cung_caps, :hoa_dons, :hangs, :khoan_vays, :tra_nos
end
