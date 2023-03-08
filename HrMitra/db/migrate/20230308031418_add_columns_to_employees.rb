class AddColumnsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :job_title, :string
  end
end
