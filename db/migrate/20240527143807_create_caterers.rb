class CreateCaterers < ActiveRecord::Migration[7.1]
  def change
    create_table :caterers do |t|
      t.string :address
      t.string :cuisine
      t.string :description
      t.float :price_per_hour
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
