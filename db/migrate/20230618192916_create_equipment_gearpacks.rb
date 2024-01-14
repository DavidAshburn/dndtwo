class CreateEquipmentGearpacks < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_gearpacks, :id => false do |t|
      t.integer :equipment_id
      t.integer :gearpack_id
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
