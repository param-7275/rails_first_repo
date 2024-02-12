class AddImageToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :employee_image, :string
  end
end
