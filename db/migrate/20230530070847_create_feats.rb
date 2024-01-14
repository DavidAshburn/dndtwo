class CreateFeats < ActiveRecord::Migration[7.0]
  def change
    create_table :feats do |t|
      t.string :name
      t.string :description
      t.string :features, array: true, default: []
      t.string :extra_languages, default: 0
      t.text :extra_spells, default: "{}"
      t.text :specific_spells, default: "{}"
      t.text :custom_mods, default: "{}"

      t.timestamps
    end
  end
end
