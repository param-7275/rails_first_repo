# spec/models/employee_spec.rb
require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'is valid with valid attributes' do
    employee = Employee.new(employee_first_name: 'JohnDoe', employee_email: 'John@example.com')
    if employee.valid?
      puts 'Employee is valid!'
    else
      puts 'Employee is not valid. Errors:'
      puts employee.errors.full_messages
    end
    expect(employee).to be_valid
  end

  it 'is not valid without a employee_email' do
    employee = Employee.new(employee_email: 'John@example.com')
    expect(employee).to_not be_valid
  end

  it 'is not valid without a employee_first_name' do
    employee = Employee.new(employee_first_name: 'John Doe')
    expect(employee).to_not be_valid
  end
end
