module Devise
  module StrongParameters
    extend ActiveSupport::Concern

    protected

    def resource_params
      # TODO: there are probably more attributes to add to #permit in order to
      #       support other devise functions
      params.require(resource_name) \
            .permit(:current_password, :email, :password,
                    :password_confirmation, :remember_me)
    end
  end
end

# nasty monkey patch to avoid subclassing devise controllers
Devise::PasswordsController.send     :include, Devise::StrongParameters
Devise::RegistrationsController.send :include, Devise::StrongParameters
