class RegistrationsController < Devise::RegistrationsController
	# Agregar campos personalizados a Devise
	before_filter :configure_permitted_parameters

	# GET /users/sign_up
	def new
		# Override Devise default behaviour and create a profile as well
		build_resource({})
		resource.build_person
		respond_with self.resource
	end

	protected

	def configure_permitted_parameters
		# Permitimos campos de Devise + los personalizados en un hash
		devise_parameter_sanitizer.for(:sign_up) { |u|
			u.permit(:email, :password, :password_confirmation,
				person_attributes: [
					:name, :last_name, :gender, :nationality, :birthday,
					:phone_number, :fav_movie, :fav_music_gender, :fav_pet
					]
				)
		}

		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:password, :password_confirmation, :current_password,
				person_attributes: [
					:name, :last_name, :gender, :nationality, :birthday,
					:phone_number, :fav_movie, :fav_music_gender, :fav_pet
					]
				)
		end
	end

end