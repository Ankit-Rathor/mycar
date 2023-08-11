class AddMechenicIdToService < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :mechanic_id, :integer
  end
end
