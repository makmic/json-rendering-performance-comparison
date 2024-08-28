Rails.application.routes.draw do
  root "fat_models#index"

  resource :fat_models, only: [:index] do
    collection do
      Constants::ACTIONS.each do |action|
        get action
      end
    end
  end
end
