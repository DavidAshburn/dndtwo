class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.integer :race_id
      t.integer :subrace_id
      t.integer :player_class_id
      t.integer :background_id
      t.integer :feat_id
      t.integer :user_id
      t.string :player_name
      t.string :char_name
      t.string :age
      t.string :height
      t.string :eyes
      t.string :hair
      t.string :skin
      t.string :gender
      t.string :description
      t.string :languages, array: true, default: []
      t.string :weapon_prof, array: true, default: []
      t.string :armor_prof, array: true, default: []
      t.string :tool_prof, array: true, default: []
      t.string :skill_prof, array: true, default: []
      t.string :expertise, array: true, default: []
      t.string :size
      t.integer :speed
      t.integer :hp_max
      t.string :equipment, array: true, default: []
      t.integer :gold
      t.integer :silver
      t.integer :copper
      t.string :spells, array: true, default: []
      t.integer :spell_slots, array: true, default: []
      t.string :trait
      t.string :ideal
      t.string :bond
      t.string :flaw
      t.string :bkgd_specialty

      t.timestamps
    end
  end
end
