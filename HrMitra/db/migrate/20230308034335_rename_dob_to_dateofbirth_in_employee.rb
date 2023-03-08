class RenameDobToDateofbirthInEmployee < ActiveRecord::Migration[6.1]
  def change
    rename_column :employees,:dob,:date_of_birth
  end
end
