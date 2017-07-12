class CreateSegments < ActiveRecord::Migration[5.1]
  def change
    create_table :segments do |t|
      t.string :name
      t.string :from
      t.string :from_lat
      t.string :from_lng
      t.string :to
      t.string :to_lat
      t.string :to_lng
      t.string :distance
      t.string :time
      t.string :veh_type
      t.integer :price
      t.integer :min
      t.integer :max
      t.integer :source_id

      t.timestamps
    end
  end
end
