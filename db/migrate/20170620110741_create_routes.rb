class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :from
      t.string :from_countrycode
      t.string :to
      t.string :to_countrycode
      t.timestamps
    end
  end
end
