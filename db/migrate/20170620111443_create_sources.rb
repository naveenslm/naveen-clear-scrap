class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :from
      t.string :from_lat
      t.string :from_lng
      t.string :to
      t.string :to_lat
      t.string :to_lng
      t.string :distance
      t.string :time
      t.integer :price
      t.integer :min_price
      t.integer :max_price
      t.integer :route_id

      t.timestamps
    end
  end
end
