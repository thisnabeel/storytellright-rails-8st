class UsersController < ApplicationController
   def make_user

		begin

			if User.authenticate(params[:email], params[:password]).present?

				user = User.authenticate(params[:email], params[:password])

				sign_in(:user, user)
				render status: 200, json: {
					user: user,
					swal: {
						:title => "Welcome Back!",
						:text => "Sign In Successful"
					}
				}.to_json


            else
                user = User.new(
                    name: params[:name],
                    email: params[:email], 
                    password: params[:password], 
                    password_confirmation: params[:password_confirmation]
                )

				if user.save

					sign_in(:user, user)
					render status: 200, json: {
						user: user,
						swal: {
							:title => "Welcome In!",
							:text => "Sign Up Successful"
						}
					}.to_json

				else  

					render status: 200, json: {
					    error: user.errors,
					}.to_json

				end
			end

			

			return

		rescue StandardError => e 

			render status: 404, json: {
			message: e,
			}.to_json
			return

		end

    end
      
private

	def user_params
		params.require(:user).permit(:name, :email,:password,:password_confirmation)
	end

end