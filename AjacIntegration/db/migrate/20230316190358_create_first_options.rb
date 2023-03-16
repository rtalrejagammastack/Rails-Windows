class CreateFirstOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :first_options do |t|
      t.string :name

      t.timestamps
    end
  end
end
