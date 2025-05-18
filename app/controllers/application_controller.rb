class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # acts_as_token_authentication_handler_for User, fallback: :none
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery unless: -> { request.format.json? }
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def	generate_csrf
		render json: SecureRandom.base64(32) 
  end
  
  	  
	protected

		def configure_permitted_parameters
      added_attrs = [:email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
  
    private
		  def authenticate_user!
        if !current_user && request.headers['X-User-Token'].present?
          begin
            user = User.find_by(email: request.headers['X-User-Email'])
            if user.tokens.include? request.headers['X-User-Token']
              sign_in(user) 
            end
          rescue StandardError => e
            puts "******"
            puts e
          end
        end
      end
end
