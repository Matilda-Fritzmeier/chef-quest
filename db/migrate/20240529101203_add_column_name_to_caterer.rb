class AddColumnNameToCaterer < ActiveRecord::Migration[7.1]
  def change
    add_column :caterers, :name, :string
  end
end
