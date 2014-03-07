class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :add_sanitized_params

  def add_sanitized_params
    devise_parameter_sanitizer.for(:account_update).push(:gets_daily_dharma)
  end
end
