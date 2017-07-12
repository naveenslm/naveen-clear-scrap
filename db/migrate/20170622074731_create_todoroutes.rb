class CreateTodoroutes < ActiveRecord::Migration[5.1]
  def change
    create_table :todoroutes do |t|
      t.string :from
      t.string :to
      t.integer :rou_id

      t.timestamps
    end
  end
end
