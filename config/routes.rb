Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vat_lieus, :nha_cung_caps, :hoa_dons, :hangs
end
