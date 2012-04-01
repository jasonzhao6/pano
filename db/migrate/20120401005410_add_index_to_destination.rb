class AddIndexToDestination < ActiveRecord::Migration
  def change
    execute "CREATE INDEX country_idx ON destinations (country);"
    execute "CREATE UNIQUE INDEX pano_id_idx ON destinations (pano_id);"
  end
end
