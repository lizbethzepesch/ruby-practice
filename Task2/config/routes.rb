Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "landing_page#index"

  get '/auth/:provider/callback', to: 'authorization#omniauth'
  # registration user controller
  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'
  get '/sign_up/verification', to: 'registrations#edit'
  delete 'destroy', to: 'registrations#destroy', as: 'destroy'
  patch '/sign_up/verification', to: 'registrations#update'
  get '/sign_up/verification/resend/', to: 'registrations#resend', as: 'resend'

  # registration coach controller
  get '/become_coach', to: 'registration_coaches#new'
  post '/become_coach', to: 'registration_coaches#create'
  delete 'destroy_coach', to: 'registration_coaches#destroy', as: 'back_to_sign_up'
  get '/become_coach/update', to: 'registration_coaches#edit'
  patch '/become_coach/update', to: 'registration_coaches#update'
  get '/become_coach/update/resend/', to: 'registration_coaches#resend', as: 'resend_coach'


  # authorization user controller
  get '/sign_in', to: 'authorization#new'
  post '/sign_in', to: 'authorization#create'
  delete 'logout', to: 'authorization#destroy'

  # authorization coach controller
  get '/sign_in/coach', to: 'authorization_coach#new'
  post '/sign_in/coach', to: 'authorization_coach#create'
  delete 'logout_coach', to: 'authorization_coach#destroy', as: 'logout_coach'

  # user contoller
  get '/user/', to: 'user#dashboard', as: 'user_page'
  get '/user/update', to: 'user#edit', as: 'update_profile_user'
  patch '/user/update', to: 'user#update'
  get '/user/password_change', to: 'user#password_edit', as: 'password_change_user'
  patch '/user/password_change', to: 'user#password_update'
  get '/user/dashboard', to: 'user#dashboard', as: 'user_dashboard_page'
  get '/user/coaches', to: 'user#coaches_page', as: 'user_coahes_page'
  get '/user/coaches/invitation/:coach_id', to: "user#new", as: 'invitation'
  post 'user/coaches/invitation/:coach_id', to: "user#send_invintation"
  delete 'cancel/:invite_id', to: 'user#cancel_invite', as: 'cancel_coach_invite'
  get '/user/ask', to: 'user#modal_ask_form', as: 'asking_form'
  delete 'end/:invite_id', to: 'user#end_cooperation', as: 'end_cooperation_coach_invite'
  get '/user/dashboard/:technique_id/step/:step_id', to: 'user#user_technique_detail', as: 'user_technique_detail'
  patch '/user/dashboard/:technique_id/step/:step_id', to: 'user#restart', as: 'restart'
  get '/user/my_techniques', to: 'user#my_techniques', as: 'user_techniques_page'
  get '/user/dashboard/:technique_id/step/:step_id/rate', to: 'user#finish', as: 'user_rate_window'
  post '/user/dashboard/:technique_id/step/:step_id/rate', to: 'user#like', as: 'like_rating'
  post '/user/dashboard/:technique_id/step/:step_id/rate/dislike', to: 'user#dislike', as: 'dislike_rating'
  # coach contoller
  get '/coach/', to: 'coach#dashboard', as: 'coach_page'
  get '/coach/update', to: 'coach#edit', as: 'update_profile_coach'
  patch '/coach/update', to: 'coach#update'
  get '/coach/password_change', to: 'coach#password_edit', as: 'password_change_coach'
  patch '/coach/password_change', to: 'coach#password_update'
  get '/coach/dashboard', to: 'coach#dashboard', as: 'coach_dashboard_page'
  get '/coach/my_users', to: 'coach#coach_users', as: 'coach_users_page'
  get '/coach/library', to: 'coach#library', as: 'coach_library_page'
  delete 'refuse/:invite_id', to: 'coach#refuse', as: 'refuse_user_invite'
  patch 'confirm/:invite_id', to: 'coach#confirm', as: 'confirm_user_invite'
  get '/coach/library/:technique_id', to: 'coach#technique_detail', as: 'technique_detail_page'
  get '/coach/library/:technique_id/recommendation', to: 'coach#new', as: 'recommend_to_users_page'
  post '/coach/library/:technique_id/recommendation', to: 'coach#create'
  get '/coach/user/:user_id/detail', to: 'coach#user_detail', as: 'user_detail'



  # reset password contoller
  get '/reset_password/new', to: 'reset_password#new'
  post '/reset_password/new', to: 'reset_password#create'
  get '/reset_password/edit', to: 'reset_password#edit'
  patch '/reset_password/edit', to: 'reset_password#update'
  get '/reset_password/edit/resend/', to: 'reset_password#resend', as: 'resend_user_reset'

  # reset password coach controller
  get '/reset_password_coach/new', to: "reset_password_coach#new"
  post '/reset_password_coach/new', to: "reset_password_coach#create"
  get '/reset_password_coach/edit', to: "reset_password_coach#edit"
  patch '/reset_password_coach/edit', to: "reset_password_coach#update"
  get '/reset_password_coach/edit/resend/', to: 'reset_password_coach#resend', as: 'resend_coach_reset'

  # api authorization user

  namespace :api do
    post '/auth/user/login', to: 'authorization#login'
    post '/auth/user/registration', to: 'registration#registration'
    get '/auth/user/detail', to: 'user#show'
  end
end
