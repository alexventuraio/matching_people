class MatchController < ApplicationController
	# Necesita loguearse para ver los marching
	before_action :authenticate_user!

	def index
		if request.post?
			data = []
			data[0] = params[:genero]
			data[1] = "#{get_year(params[:edad])}-01-01"
			data[2] = params[:nacionalidad]

			# Imprimir cadenas en la consola puts == p
			puts '*'*80
			p data;
			puts '*'*80

			# if data[2].eql? "nacional"
				query = Person.joins(:user).where(people: {gender: data[0], nationality: data[2]}).where("birthday >= :init_edad", {init_edad: data[1]})
			# else
			# 	query = Person.joins(:user).where(people: {gender: data[0]}).where.not(nationality: "Mexico").where("birthday >= :init_edad", {init_edad: data[1]})
			# end

			@matched_people = query

			# @matched_people = Person.joins(:user).where("edad >= :init_edad", {init_edad: 18})
			# Person.joins(:posts).where("posts.created_at < ?", Time.now)
		else
			redirect_to root_path, notice: "Seleccione los filtros deseados para buscar!"
		end
	end

	private

	def get_year(age)
		year = Date.today.year - age.to_i
	end

end
