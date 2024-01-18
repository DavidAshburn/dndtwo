class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :asi, array: true, default: [0,0,0,0,0,0]
      t.integer :age_limit, default: 500
      t.string :heightlow, default: "4'6\""
      t.string :heighthigh, default: "7\"6"
      t.string :languages, array: true, default: []
      t.integer :extra_languages, default: 0
      t.string :weapons, array: true, default: []
      t.string :armor, array: true, default: []
      t.string :tools, array: true, default: []
      t.string :skills, array: true, default: []
      t.string :tool_choice, array: true, default: []
      t.string :size, default: 'medium'
      t.integer :speed, default: 15
      t.string :features, array: true, default: []
      t.integer :sub_count, default: 0
      t.text :extra_spells, default: "{}"
      t.text :specific_spells, default: "{}"
      t.text :custom_mods, default: "{}"

      #all extra spells formatted the same way
      #extra_spell_lists = {
      #  spelllist name => {
      #    level = int
      #    source = int
      #    #we dont use a spell_table because some of thee will requre spells_or_cantrips choices
      #    cantrips_choices [x,y,z...] //value for each character level, single value means they are all the same
      #    spells_choices [xyz]
      #    spells_or_cantrips [xyz]
      #    spell_ability, // accomodate a 'own' keyword for the character's casting ability
      #    spells_are_extra, wether to count these spells in Spells Known
      #  },
      #  othr_spelllist_name => {...ss},
      #  ...
      #}

      #specific_spells: {
      #  source=> name
      #  1=> ['Dancing Lights', 'cantrip'],
      #  3=> ['Faerie Fire', 'long rest'],
      #  5=> ['Darkness', 'long rest'],
      #  'stat'=> ['Charisma'],
      #},

      t.timestamps
    end
  end
end
