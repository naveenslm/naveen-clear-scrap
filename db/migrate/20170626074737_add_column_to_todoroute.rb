class AddColumnToTodoroute < ActiveRecord::Migration[5.1]
  def change
    add_column :todoroutes, :rou_type, :string
  end
end
