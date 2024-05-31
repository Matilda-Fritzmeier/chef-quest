class AddCoordinatesToCaterers < ActiveRecord::Migration[7.1]
  def change
    add_column :caterers, :lat, :float
    add_column :caterers, :long, :float
  end
end
