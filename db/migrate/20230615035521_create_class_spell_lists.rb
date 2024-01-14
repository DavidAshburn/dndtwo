class CreateClassSpellLists < ActiveRecord::Migration[7.0]
  def change
    create_table :class_spell_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
