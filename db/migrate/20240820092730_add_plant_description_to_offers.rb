class AddPlantDescriptionToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :plant_description, :string
  end
end
