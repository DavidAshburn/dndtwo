class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :wep_type, default: 'simple'
      t.integer :ranged, default: 0
      t.string :hit_die, default: '1d4'
      t.string :dmg_type, default: 'bludgeoning'
      t.string :properties, array: true, default: []
      t.integer :weight, default: 0
      t.integer :cost_gp, default: 0
      t.string :name, default: ''
      t.string :description, default: ''

      t.timestamps
    end
  end
end
