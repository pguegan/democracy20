Rails.application.routes.draw do

  resources :candidates

  root to: "candidates#index"

end
