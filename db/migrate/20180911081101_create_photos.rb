class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.string :name
      t.string :format_name
      t.string :title
      t.string :width
      t.string :height

      t.timestamps null: false
    end
  end
end
