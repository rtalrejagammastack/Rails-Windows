class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :name
      t.references :first_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
