Rails.application.routes.draw do
  get 'stock/index'
  post 'stock/index'
  post 'stock/ajax_regist_mylist'

  get 'my_list/index'

  get 'chart/index'
  post 'chart/index'

  get 'title/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
