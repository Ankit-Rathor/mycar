class ChangeNullTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :service_id, :integer, null: true
  end
end
