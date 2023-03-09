class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :message
      t.references :post, null: false, foreign_key: true
      # t.referneces :user

      t.timestamps
    end
  end
end
