class Person < ActiveRecord::Base
	# Associations
	belongs_to :user

	# Validations
	# validates :fullname, presence: true
	validates_presence_of :name, :last_name, :gender, :nationality, :birthday,
		:phone_number, :fav_movie, :fav_music_gender, :fav_pet

	# validates_format_of :phone_number,
	# 	:with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
	# 	:message => "- Phone numbers must be in xxx-xxx-xxxx format."

	validates_format_of :phone_number,
		with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
		message: " - El número de telefono debe tener el formato xxx-xxx-xxxx."

	# Scopes para consultas en ActiveRecord
	scope :masculino, -> { where(sexo: "masculino") }
	scope :mayor_que, ->(date) { where("birthday > ?", date) }


	# Para obtener la edad en las vistas
	def age(birthday)
		(Time.now.to_s(:number).to_i - birthday.to_time.to_s(:number).to_i)/10e9.to_i
	end

	def age2(birthday)
		age = Date.today.year - birthday.year
		age -= 1 if Date.today < birthday + age.years #for days before birthday
	end
	
end
