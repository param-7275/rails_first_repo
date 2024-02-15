# db/migrate/xxxxxxxxxxxxxx_rename_employee_attributes.rb

class RenameEmployeeAttributes < ActiveRecord::Migration[6.0]
  def change
    rename_column :employees, :employee_first_name, :first_name
    rename_column :employees, :employee_last_name, :last_name
    rename_column :employees, :employee_joining_date, :joining_date
    rename_column :employees, :employee_salary, :salary
    rename_column :employees, :employee_email, :email
    rename_column :employees, :employee_contact, :contact
    rename_column :employees, :employee_age, :age
    rename_column :employees, :employee_image, :image
  end
end
# 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