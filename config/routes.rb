AdminPanel::Application.routes.draw do
  resources :sprints

  root to: "sprints#indexo"
end
