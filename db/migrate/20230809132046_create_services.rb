class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.json :service_details
      t.timestamps
    end
  end
end
