# my_gem/config/routes.rb
Rails.application.routes.draw do
  get 'app' => 'mygem/app_monitor#index', :as => :mygem
end