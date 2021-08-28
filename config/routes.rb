Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  # resourcesメソッドは、ルーティングを一括して自動生成してくれます。
  # 一方、onlyは、生成するルーティングを限定するオプションです。
  # 不要なルーティングが実行されないようにonlyを設定します。
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
end
