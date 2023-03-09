class CreateAccount1s < ActiveRecord::Migration[6.1]
  def change
    create_table :account1s do |t|
      t.integer :account_number
      t.references :supplier1, null: false, foreign_key: true

      t.timestamps
    end
  end
end
