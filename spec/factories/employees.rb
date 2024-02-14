FactoryBot.define do
    factory :employee do
      employee_first_name { 'John' }
      employee_last_name { 'Doe' }
      employee_age { 30 }
      employee_contact { '1234567890' }
      employee_email { 'john.doe@example.com' }
      employee_salary { 50000 }
      employee_joining_date { Date.today }
      user
    end
  end