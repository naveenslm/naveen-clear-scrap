class AddColumnToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :rou_type, :string
  end
end
