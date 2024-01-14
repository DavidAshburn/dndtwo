class CreateClassSpellListsSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :class_spell_lists_spells, :id => false do |t|
      t.integer :class_spell_list_id
      t.integer :spell_id

      t.timestamps
    end
  end
end
