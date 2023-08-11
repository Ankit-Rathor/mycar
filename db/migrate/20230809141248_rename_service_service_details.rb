class RenameServiceServiceDetails < ActiveRecord::Migration[7.0]
  def change
    rename_column :services, :service_details, :details
  end
end
