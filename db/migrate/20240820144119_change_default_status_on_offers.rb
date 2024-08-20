class ChangeDefaultStatusOnOffers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :offers, :status, true
  end
end
