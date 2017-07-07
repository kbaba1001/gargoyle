module Gargoyle
  module ControllerHelpers
    def self.included(base)
      base.class_eval do
        if respond_to?(:helper_method)
          helper_method :current_user, :signed_in?
        end
      end
    end

    def signed_in?
      !!current_user
    end

    def current_user
      @current_user ||= manager.find_in_scope(session[manager.session_key_name])
    end

    def sign_out
      reset_session
    end

    def sign_in(user)
      session[manager.session_key_name] = manager.serialize(user)
    end

    def authenticate_user!
      no_signin_redirect_logic.call unless signed_in?
    end

    private

    # no doc
    def manager
      @manager ||= Manager.new(auth_scope)
    end

    def auth_scope
      raise NotImplementedError
    end

    # NOTE must be return lambda
    def no_signin_redirect_logic
      raise NotImplementedError
    end
  end
end
