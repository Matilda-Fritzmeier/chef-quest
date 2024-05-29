class ChangeCatererDescriptionTypeToText < ActiveRecord::Migration[7.1]
  def change
    change_column(:caterers, :description, :text)
  end
end
