Rails.application.routes.draw do
  get 'stock/index'
  post 'stock/index'
  post 'stock/ajax_regist_mylist'
  post 'stock/add_stock_mylist'
  post 'stock/ajax_disp_chart'

  get 'my_list/index'

  get 'chart/index'
  post 'chart/index'
  post 'chart/ajax_delete_from_mylist'

  get 'title/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
