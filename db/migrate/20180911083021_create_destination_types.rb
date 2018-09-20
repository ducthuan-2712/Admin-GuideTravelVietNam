class CreateDestinationTypes < ActiveRecord::Migration
  def change
    create_table :destination_types do |t|
      t.string :name
      t.string :format_name
      t.text :description

      t.timestamps null: false
    end
  end
end
