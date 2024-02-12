class AdduserIdToEmployee < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :user_id, :integer
  end
end
