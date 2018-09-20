class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :format_name
      t.float :lat
      t.float :lng
      t.string :description
      t.string :formatted_address
      t.string :formatted_phone_number
      t.string :icon
      t.string :place_temp_google
      t.string :rating
      t.string :url
      t.string :website
      t.references :destination, index: true

      t.timestamps null: false
    end
    add_foreign_key :places, :destinations
  end
end
