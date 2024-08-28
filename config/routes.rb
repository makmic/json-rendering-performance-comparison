Rails.application.routes.draw do
  root "fat_models#index"

  resource :fat_models, only: [:index] do
    collection do
      get :jbuilder
      get :render_json
      get :select_json
      get :indexed_json
      get :plucked
      get :db_live_computed
      get :parsed_materialized_view
      get :raw_materialized_view
    end
  end
end
