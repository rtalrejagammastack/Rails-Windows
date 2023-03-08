class RenmaeContextToContentInMessages < ActiveRecord::Migration[6.1]
  def change
    rename_column :messages,:context,:content
  end
end
