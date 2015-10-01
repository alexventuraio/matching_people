class User < ActiveRecord::Base
	# Associations
	has_one :person, dependent: :destroy, autosave: true

	# Allow saving of attributes on associated records through the parent,
	# :autosave option is automatically enabled on every association
	accepts_nested_attributes_for :person

	# Devise
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable


end
