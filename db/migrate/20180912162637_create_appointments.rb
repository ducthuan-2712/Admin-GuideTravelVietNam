class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :destination, index: true
      t.references :destination_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :appointments, :destination
    add_foreign_key :appointments, :destination_type
  end
end
