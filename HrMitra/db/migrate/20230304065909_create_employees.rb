class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :address

      t.timestamps
    end
  end
end
