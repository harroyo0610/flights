Rails.application.routes.draw do
  root 'flights#home'
  get   'home'  =>  'flights#home'
  post  'home'   =>  'flights#search'
  get   'index'  =>  'flights#index'
  post  'index'  =>  'flights#reserv'
  get   'booking'=>  'flights#new'
  post  'booking'=>  'flights#create'
  get   'buy'    =>  'flights#buy' 
end
