class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name, default: ''
      t.string :description, default: ''
      t.integer :count, default: 1
      t.integer :weight, default: 0
      t.integer :cost_gp, default: 0

      t.timestamps
    end
  end
end
