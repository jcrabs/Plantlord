class RenameBodyToContent < ActiveRecord::Migration[7.1]
  def change
    rename_column :offers, :plant, :plant_name
  end
end
