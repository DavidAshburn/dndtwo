class CreateBackgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :backgrounds do |t|
      t.string :name
      t.text :description
      t.string :skills, array: true, default: []
      t.string :weapons, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :tools, array: true, default: []
      t.integer :extra_languages, default: 0
      t.text :equipment_choices, default: "{}"
      t.string :features, array: true, default: []
      t.string :traits, array: true, default: []
      t.string :ideals, array: true, default: []
      t.string :bonds, array: true, default: []
      t.string :flaws, array: true, default: []
      t.string :specialties, array: true, default: []
      t.string :specialty_description
      t.integer :gold
      t.text :extra_spells, default: "{}"
      t.text :specific_spells, default: "{}"
      t.text :custom_mods, default: "{}"

      t.timestamps
    end
  end
end
