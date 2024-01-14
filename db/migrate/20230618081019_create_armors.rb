class CreateArmors < ActiveRecord::Migration[7.0]
  def change
    create_table :armors do |t|
      t.string :arm_type, default: 'Light'
      t.integer :ac_base, default: 11
      t.integer :str_req, default: 0
      t.integer :stealth_disadvantage, default: 0
      t.integer :weight, default: 0
      t.integer :cost_gp, default: 0
      t.string :name, default: ''
      t.string :description, default: ''

      t.timestamps
    end
  end
end
