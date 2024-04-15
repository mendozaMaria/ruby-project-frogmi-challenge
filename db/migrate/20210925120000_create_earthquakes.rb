class CreateEarthquakes < ActiveRecord::Migration[6.0]
    def change
      create_table :earthquakes do |t|
        t.float :magnitude
        t.string :place
        t.datetime :time
        t.timestamps
      end
    end
  end