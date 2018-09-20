class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :format_name
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
