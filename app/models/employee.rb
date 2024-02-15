class Employee < ApplicationRecord
	attribute :first_name,:string
	attribute :last_name,:string
	attribute :joining_date,:date
	attribute :salary,:string
	attribute :email,:string
	attribute :contact,:integer
	attribute :age,:integer
	attribute :image,:string



	# has_one_attached :avatar
	acts_as_paranoid
	# validates :employee_first_name, :employee_last_name,
	# 	:employee_joining_date,:employee_salary ,presence: true
	validates :email, presence: true, uniqueness: true
	# validates :employee_contact, presence: true , length: {is:10}, numericality: {only_integer: true}
	# validates :employee_age, presence: true , length: {is:2}, numericality: {only_integer: true}
	validates :first_name,presence: true
	before_validation :upcase_data
	def upcase_data
		self.first_name =  first_name.capitalize if first_name.present?
	end

	def full_name
		"#{first_name} #{last_name}"
	end


	
	# belongs_to :user
end
