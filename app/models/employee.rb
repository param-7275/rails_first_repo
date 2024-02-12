class Employee < ApplicationRecord
	# has_one_attached :avatar
	acts_as_paranoid
	validates :employee_first_name, :employee_last_name,
		:employee_joining_date,:employee_salary ,presence: true
	validates :employee_email, presence: true, uniqueness: true
	validates :employee_contact, presence: true , length: {is:10}, numericality: {only_integer: true}
	validates :employee_age, presence: true , length: {is:2}, numericality: {only_integer: true}

	before_validation :upcase_data
	def upcase_data
		self.employee_first_name =  employee_first_name.capitalize if employee_first_name.present?
	end

	def employee_full_name
		"#{employee_first_name} #{employee_last_name}"
	end


	
	belongs_to :user
end
