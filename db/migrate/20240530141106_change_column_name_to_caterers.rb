class ChangeColumnNameToCaterers < ActiveRecord::Migration[7.1]
  def change
    rename_column :caterers, :lat, :latitude
    rename_column :caterers, :long, :longitude
  end
end
