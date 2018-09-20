class AddReferencesToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :destination, index: true
    add_foreign_key :photos, :destinations
    add_reference :photos, :place, index: true
    add_foreign_key :photos, :places
  end
end
