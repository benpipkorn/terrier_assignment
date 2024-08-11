class CreateWorkOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :work_orders do |t|
      t.string :technician_id
      t.string :location_id
      t.datetime :time
      t.integer :duration
      t.integer :price

      t.timestamps
    end
  end
end
