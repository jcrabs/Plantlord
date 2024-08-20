class DropAddresses < ActiveRecord::Migration[7.1]
  def change
    drop_table :addresses
  end
end
