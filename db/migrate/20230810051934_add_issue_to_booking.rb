class AddIssueToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :issue, :string
  end
end
