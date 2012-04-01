class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.timestamps
      t.string :pano_id
      t.float :latitude
      t.float :longitude
      t.float :heading
      t.float :pitch
      t.integer :zoom
      t.string :city
      t.string :state
      t.string :country
    end
  end
end
