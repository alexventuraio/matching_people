class WelcomeController < ApplicationController
	def index
		# Traemos todas las nacionalidades y las agrupamos
		# para llenar el combobox en el index
		@nationalities = Person.select([:nationality]).group(:nationality)

		# Así llenamos un combobox con select_tag
		# <% options = options_from_collection_for_select(@nationalities, 'nationality', 'nationality') %>
		# <% select_tag 'nacionalidad', options, class: 'browser-default' %>
	end
end
