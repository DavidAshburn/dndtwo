class CreateSubraces < ActiveRecord::Migration[7.0]
  def change
    create_table :subraces do |t|
       t.integer :race_id
      t.string :name
      t.integer :asi, array: true, default: []
      t.string :languages, array: true, default: []
      t.integer :extra_languages, default: 0
      t.string :weapons, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :tools, array: true, default: []
      t.string :features, array: true, default: []
      t.text :extra_spells, default: "{}"
      t.text :specific_spells, default: "{}"
      t.text :custom_mods, default: "{}"

      t.timestamps
    end
  end
end
