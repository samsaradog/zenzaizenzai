class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.date :date, :null => false
      t.integer :jewel_id, :null => false
    end
  end
end
