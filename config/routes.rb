Twitoogle::Application.routes.draw do
  get "/search/new", to: "search#new", as: :new_search
  get "/search", to: "search#fetch"
  root :to => "search#index"
end
