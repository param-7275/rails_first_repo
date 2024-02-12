class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :employee_first_name
      t.string :employee_last_name
      t.integer :employee_age
      t.integer :employee_contact
      t.string :employee_email
      t.integer :employee_salary
      t.date :employee_joining_date

      t.timestamps
    end
  end
end
