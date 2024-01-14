class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.integer :level, default: 0
      t.text :description
      t.string :school
      t.integer :ritual, default: 0
      t.string :cast_time, default: '1 action'
      t.string :range, default: 'Self'
      t.string :components, array: true, default: ['V','S','']
      t.string :duration, default: 'Instantaneous'
      t.string :attack, default: 'false'
      t.text :atk_dmg, default: "{}"
      t.string :dmg_type, default: 'none'

      t.timestamps
    end
  end
end
