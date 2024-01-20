class CreateSubclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :subclasses do |t|
      t.integer :player_class_id
      t.string :name
      t.text :features, default: "{}"
      t.text :leveled_choice, default: "{}"
      t.text :extra_spells, default: "{}"
      t.text :custom_mods, default: "{}"
      t.text :specific_spells, default: "{}"
      t.text :equipment_choices, default: "{}"
      t.string :skills, array: true, default: []
      t.string :weapons, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :tools, array: true, default: []
      t.string :languages, array: true, default: []
      t.integer :extra_languages, default: 0
      t.string :description, default: ""

      t.timestamps
    end
  end
end
