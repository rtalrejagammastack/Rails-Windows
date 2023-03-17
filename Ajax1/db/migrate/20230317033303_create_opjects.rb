class CreateOpjects < ActiveRecord::Migration[6.1]
  def change
    create_table :opjects do |t|
      t.string :first_select
      t.string :second_select

      t.timestamps
    end
  end
end
