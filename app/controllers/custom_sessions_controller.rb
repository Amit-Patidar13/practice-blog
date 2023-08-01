# class CustomSessionsController < Devise::SessionsController
# 	def create
# 		super do |resource|
# 			if resource.persisted?
# 				# render json: { user: resource, token: request.env['warden-jwt_auth.token'] }
# 			render json: {	
# 				message: 'Signed up successfully.',
#         data: UserSerializer.new(current_user).serializable_hash[:data][:attributes], token: request.env['warden-jwt_auth.token'],
# 				token: request.env['warden-jwt_auth.token']
#       }, status: :ok
# 			end
# 		end
# 	end
# end