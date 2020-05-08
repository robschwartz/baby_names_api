Rails.application.routes.draw do
  scope '/api/v1' do
    resources :baby_names
  end
end
