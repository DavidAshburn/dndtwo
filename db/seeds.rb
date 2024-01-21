# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Race.destroy_all
Subrace.destroy_all
PlayerClass.destroy_all
Subclass.destroy_all
Background.destroy_all
Feat.destroy_all
Character.destroy_all
Spell.destroy_all
ClassSpellList.destroy_all
ClassSpellListsSpells.destroy_all
Armor.destroy_all
Weapon.destroy_all
Equipment.destroy_all
Tool.destroy_all
Gearpack.destroy_all
EquipmentGearpack.destroy_all
GearpacksTool.destroy_all


DwarvenRace = Race.create(
  name: 'Dwarf',
  asi: [0,0,2,0,0,0],
  age_limit: 450,
  heightlow: "4'",
  heighthigh: "5'",
  languages: ['Common', 'Dwarvish'],
  weapons: ['Battleaxe', 'Handaxe', 'Light Hammer', 'Warhammer'],
  tool_choice: [
    'Smith`s Tools',
    'Brewer`s Supplies',
    'Mason`s Tools',
  ],
  speed: 25,
  features: [
    'Napoleonic Vigor: Speed not reduced by heavy armor',
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Dwarven Resilience: Advantage on Poison saves and resistance to Poison damage.',
    'Stonecunning: Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

DwarvenRace.subraces.create(
  name: 'Hill Dwarves',
  asi: [0,0,0,0,1,0],
  features: [
        'Dwarven Toughness: Your level is added to your hit point maximum.',
      ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'hp' => 'this.level',
  },
)

DwarvenRace.subraces.create(
  name: 'Mountain Dwarves',
  asi: [2,0,0,0,0,0],
  features: ['Dwarven Armor Training'],
  armor: ['Light','Medium'],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

ElvenRace = Race.create(
  name: 'Elf',
  asi: [0,2,0,0,0,0],
  age_limit: 750,
  heightlow: "5'",
  heighthigh: "6'10''",
  languages: ['Common', 'Elvish'],
  speed: 30,
  features: [
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Keen Senses: You have proficiency in Perception.',
    'Fey Ancestry: You have advantage on saving throws against being charmed, and can\'t be put to sleep magically.',
    'Trance: Elves don\'t need to sleep. Instead they meditate deeply for 4 hours a day.',
    'Proficiency: Perception',
    ],
  skills: ['Perception'],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

ElvenRace.subraces.create(
  name: 'High Elf',
  asi: [0,0,0,1,0,0],
  features: [
    'Elven Weapon Training: You have proficiency with the longsword, shortsword, shortbow, and longbow.',
    'Cantrip: You know one cantrip of your choice from the Wizard spell list. Intelligence is your spellcasting stat for that spell.',
    'Extra Language: You can speak read, and write one extra language.',
  ],
  extra_languages: 1,
  extra_spells: {
    'Wizard'=> {
      'source'=> 'High Elf',
      'cantrips_choices'=> [
        [1,1]
      ],
      'spells_choices'=> 0,
      'spell_ability'=> 'Intelligence',
      'spells_are_extra'=> true,
    },
  },
  specific_spells: {},
  custom_mods: {},
)

ElvenRace.subraces.create(
  name: 'Wood Elf',
  asi: [0,0,0,0,1,0],
  features: [
    'Elven Weapon Training: You have proficiency with the longsword, shortsword, shortbow, and longbow',
    'Fleet of Foot: Your base walking speed increases to 35 feet.',
    'Mask of the Wild: You can attempt to hide even when you are onluy lightly obscured.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'speed' => '35',
  },
)

ElvenRace.subraces.create(
  name: 'Drow',
  asi: [0,0,0,0,0,1],
  features: [
    'Superior Darkvision: Your darkvision has a radius of 120 feet.',
    'Sunlight Sensitivity: You have disadvantage on attack rolls and on Wisdom(Perception) checks that rely on sight when you, the target of your attack, or whatever you are trying to perceive is in direct sunlight.',
    'Drow Magic: You know the dancing lights cantrip. When you reach 3rd level you can cast faerie fire once per long rest. At 5th level you can cast darkness once per long rest. Charisma is your spellcasting ability for these spells.',
    'Drow Weapon Training: You have proficiency with rapiers, shortswords, and hand crossbows.',
  ],
  weapons: ['Rapier','Shortsword','Hand Crossbow'],
  extra_spells: {},
  specific_spells: {
    1=> [['Dancing Lights', 'Cantrip']],
    3=> [['Faerie Fire', 'Long Rest']],
    5=> [['Darkness', 'Long Rest']],
    'stat'=> 'Charisma',
    'source'=> 'Drow',
  },
  custom_mods: {},
)

HalflingRace = Race.create(
  name: 'Halfling',
  asi: [0,2,0,0,0,0],
  age_limit: 250,
  heightlow: "3'",
  heighthigh: "4'",
  languages: ['Common', 'Halfling'],
  speed: 25,
  features: [
    'Lucky: When you roll a 1 on a d20 for an attack, ability check, or save, you can reroll the die and must use the new roll.',
    'Brave: You have advantage on saving throws against being frightened.',
    'Halfling Nimbleness: You can move through the space of any creature that is of a size larger than yours.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HalflingRace.subraces.create(
  name: 'Lightfoot',
  asi: [0,0,0,0,0,1],
  features: [
    'Naturally Stealthy: You can attempt to hide even when you are only obscured by a creature one size larger than you.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HalflingRace.subraces.create(
  name: 'Stout',
  asi: [0,0,1,0,0,0],
  features: [
    'Stout Resilience: You have advantage on saving throws against poison, and you have resistance against poison damage.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HumanRace = Race.create(
  name: 'Human',
  asi: [1,1,1,1,1,1],
  age_limit: 90,
  heightlow: "5'",
  heighthigh: "6'6''",
  languages: ['Common'],
  extra_languages: 1,
  speed: 30,
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HumanRace.subraces.create(
  name: 'None',
  asi: [0,0,0,0,0,0],
  features: [
      ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
  },
)

DragonbornRace = Race.create(
  name: 'Dragonborn',
  asi: [2,0,0,0,0,1],
  age_limit: 80,
  heightlow: "6'",
  heighthigh: "7'",
  languages: ['Common', 'Draconic'],
  speed: 30,
  features: [],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

DragonbornRace.subraces.create(
  name: 'Black Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale scorching acid in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Acid damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Acid damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Acid Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Acid',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Blue Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale arcs of lightning in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Lightning damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Lightning damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Lightning Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Lightning',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Brass Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale scorching acid in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Fire damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Fire damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Fire Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Fire',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Bronze Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale arcs of lightning in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Lightning damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Lightning damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Lightning Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Lightning',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Copper Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale scorching acid in a 5 by 30ft line. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Acid damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Acid damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Acid Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Acid',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Gold Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale fire in a 15 foot cone. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Fire damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Fire damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Fire Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Fire',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Green Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale acrid poisonous spray in a 15 foot cone. Each creature in the area must make a Constitution save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Poison damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Poison damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Poison Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Poison',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Red Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale scorching flames in a 15 foot cone. Each creature in the area must make a Dexterity save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Fire damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Fire damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Fire Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Fire',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'Silver Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale withering cold in a 15 foot cone. Each creature in the area must make a Constitution save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Cold damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Cold damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Cold Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Cold',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

DragonbornRace.subraces.create(
  name: 'White Dragon',
  asi: [0,0,0,0,0,0],
  features: [
    'Breath Weapon: You can use your action to exhale withering cold in a 15 foot cone. Each creature in the area must make a Constitution save with DC equal to 8 + your CON modifier + your proficiency bonus. A creature takes 2d6 Cold damage on a fail and half on a success. The damage increases to 3d6 at 6th level, 4d6 at 11th level and 5d6 at 16th level. You can\'t use it more than once per short rest.',
    'Draconic Resistance: You have resistance to Cold damage',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'attacks' => [
      {
        'name'=> 'Cold Breath',
        'bonus'=> '',
        'damage'=> [
          [1,'2d6'],
          [6,'3d6'],
          [11,'4d6'],
          [16,'5d6'],
        ],
        'dmg_type'=> 'Cold',
        'properties'=> '`Save DC = ${Util.calcMod(this.stats[2]) + this.prof_mod + 8}`',
      },
    ],
  },
)

GnomeRace = Race.create(
  name: 'Gnome',
  asi: [0,0,0,2,0,0],
  age_limit: 500,
  heightlow: "3'",
  heighthigh: "4'",
  languages: ['Common', 'Gnomish'],
  speed: 25,
  features: [
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Gnome Cunning: You have advantage on all Intelligence, Wisdom, and Charisma saving throws against magic.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

GnomeRace.subraces.create(
  name: 'Forest Gnome',
  asi: [0,1,0,0,0,0],
  features: [
    'Illusionist: You know the minor illusion cantrip and cast it with Intelligence.',
    'Speak with Small Beasts: Through sounds and gestures you can communicate simple ideas with small or smaller beasts.',
  ],
  extra_spells: {},
  specific_spells: {
    1=> [['Minor Illusion','Cantrip']],
    'stat'=> 'Intelligence',
    'source'=> 'Forest Gnome',
  },
  custom_mods: {},
)

GnomeRace.subraces.create(
  name: 'Rock Gnome',
  asi: [0,0,1,0,0,0],
  features: [
    'Artificer\'s Lore: Whenever you make an Intelligence(History) check related to magic items, alchemical objects, or technological devices, you can add twice your proficiency bonus, instead of any proficiency bonus you would normally apply.',
    'Tinker: You have proficiency with Tinker\'s Tools. Using these tools, you can spend 1 hour and 10gp worth of materials to construct a Tiny clockwork device which ceases to function after 24 hours unless you spend 1 hour repairing it.',
  ],
  tools: ['Tinker\'s Tools'],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HalfElfRace = Race.create(
  name: 'Half Elf',
  asi: [0,0,0,0,0,2],
  age_limit: 200,
  heightlow: "5'",
  heighthigh: "6'",
  languages: ['Common','Elvish'],
  extra_languages: 1,
  extra_skills: 2,
  extra_asi: 2,
  speed: 30,
  features: [
    'Adaptable: Choose two ability scores to increase by one.',
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Fey Ancestry: You have advantage on saving throws against being charmed, and magic can\'t put you to sleep.',
    'Skill Versatility: You gain proficiency in two skills of your choice.',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)
HalfElfRace.subraces.create(
  name: 'None',
  asi: [0,0,0,0,0,0],
  features: [
      ],

  extra_spells: {},
  specific_spells: {},
  custom_mods: {
  },
)

HalfOrcRace = Race.create(
  name: 'Half Orc',
  asi: [2,0,1,0,0,0],
  age_limit: 80,
  heightlow: "5'",
  heighthigh: "7'",
  languages: ['Common', 'Orc'],
  speed: 30,
  skills: ['Intimidation'],
  features: [
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Menacing: You have proficiency in Intimidation.',
    'Relentless Endurance: When you are reduced to 0 hit points but not killed outright, you can drop to 1 hit point instead once per long rest.',
    'Savage Attacks: When you score a critical hit with a melee weapon attack, you can roll one of the weapon\'s damage dice one additional time and add it to the extra damage.',
    'Proficiency: Intimidation',
  ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

HalfOrcRace.subraces.create(
  name: 'None',
  asi: [0,0,0,0,0,0],
  features: [
      ],

  extra_spells: {},
  specific_spells: {},
  custom_mods: {
  },
)

TieflingRace = Race.create(
  name: 'Tiefling',
  asi: [0,0,0,1,0,2],
  age_limit: 100,
  heightlow: "5'",
  heighthigh: "6'6''",
  languages: ['Common', 'Infernal'],
  speed: 30,
  skills: ['Intimidation'],
  features: [
    'Darkvision: You can see in dim light within 60 feet of you as if it were brightly lit, and in darkness as if it were dim light, but you can\'t discern color.',
    'Hellish Resistance: You have resistance to fire damage.',
    'Infernal Legacy: You know the thaumaturgy cantrip. At 3rd level, you can cast hellish rebuke as a 2nd level spell once per long rest. At 5th level you can cast darkness once per long rest. Charisma is your spellcasting ability for these spells.',
    'Proficiency: Intimidation',
  ],
  extra_spells: {},
  specific_spells: {
    1=> [['Thaumaturgy','Cantrip']],
    3=> [['Hellish Rebuke','Long Rest']],
    5=> [['Darkness','Long Rest']],
    'stat'=> 'Charisma',
    'source'=> 'Infernal Legacy',
  },
  custom_mods: {},
)

TieflingRace.subraces.create(
  name: 'None',
  asi: [0,0,0,0,0,0],
  features: [
      ],

  extra_spells: {},
  specific_spells: {},
  custom_mods: {
  },
)

Barbarian = PlayerClass.create(
  name: 'Barbarian',
  hit_die: 12,
  starting_hp: 12,
  saving_throws: [0,2],
  armor: ['Light', 'Medium', 'Shields'],
  weapons: ['Simple', 'Martial'],
  skill_choices: [
    'Animal Handling',
    'Athletics',
    'Intimidation',
    'Nature',
    'Perception',
    'Survival',
  ],
  num_skills: 2,
  equipment_choices: {
    'choices'=>[
      ['martial#1','Greataxe#1'],
      ['simple#1','Handaxe#2'],
    ],
    'default'=>['Javelin#4', "Explorer's Pack#1"],
  },
  wealth_die: 2,
  features: {
    1=>[
      'Rage: Advantage on STR checks and STR saves, Rage Damage bonus, resistance to bludgeoning, piercing and slashing damage.',
      'Unarmored Defense: Without armor your AC is 10 + your DEX modifier + your CON modifier',
    ],
    2=>[
      'Reckless Attack: Advantage on your first melee STR attack roll and attacks against you until your next turn.',
      'Danger Sense: Advantage on DEX saves against effects you can see. You can`t do this if you are blinded, deafened, or incapacitated.',
    ],
    3=>['Primal Path: Choose a path that shapes the nature of your rage.'],
    4=>["Ability Score Increase:"],
    5=>['Extra Attack: You may attack twice whenever you take the Attack action on your turn.',
       'Fast Movement: Your speed increases by 10 feet while you aren`t wearing heavy armor',
      ],
    7=>['Feral Instinct: You have advantage on initiative rolls. If you are surprised at the beginning of combat and aren`t incapacitated, you can act normall on your first turn, but only if you enter your rage before doiug anything else.'],
    8=>["Ability Score Increase:"],
    9=>['Brutal Critical: You can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.'],
    11=>['Relentless Rage: If you drop to 0 hit points while raging and don`t die outright, you can make a DC 10 CON save to drop to 1 hit point instead. The DC increases by 5 each time until you finish a short or long rest.'],
    12=>["Ability Score Increase:"],
    13=>['Brutal Critical: You can roll two additional weapon damage die when determining the extra damage for a critical hit with a melee attack.'],
    15=>['Persistent Rage: Your rage is so fierce that it ends early only if you fall unconscious or if you choose to end it.'],
    16=>["Ability Score Increase:"],
    17=>['Brutal Critical: You can roll three additional weapon damage die when determining the extra damage for a critical hit with a melee attack.'],
    18=>['Indomitable Might: If your total for a Strength check is less than your Strength score, you may use that score instead'],
    20=>['Primal Champion: Your STR and CON scores increase by 4, your maximum for those scores is now 24.'],
  },
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
  ],
  leveled_choice: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Barbarian.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Barbarian.subclasses.create(
  name: "Berserker",
  features: {
    3=> ['Frenzy: You can go into a frenzy when you rage. If you do so, for the duration of your rage, you can make a single melee weapon attack as a bonus action on each of your turns after this one. When your rage ends, you suffer one level of exhaustion.'],
    6=> ['Mindless Rage: You can`t be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage.'],
    10=> ['Intimidating Presence: You can use your action to frighten someone with your menacing presence. Choose one creature you can see within 30 feet, if it can see or hear you it must succeed on a WIS save with DC of 8 plus your proficiency bonus plus your CHA modifier, or be frightened of you until the end of your next turn. On subsequent turns you can use your action to extend this effect another turn. The effect ends if the creature ends its turn out of line of sight or more than 60 feet away. If they successfully save, you can`t use this on them again for 24 hours.'],
    14=> ['Retaliation: When you take damage from a creature within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature.']
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Barbarian.subclasses.create(
  name: "Totem Warrior",
  features: {
    3=> ['Spirit Seeker: You gain the ability to cast Beast Sense and Speak With Animals as rituals.', 'Totem Spirit: Choose a totem spirit and acquire its feature. You must make or acquire a physical totem object that imcorporates fur or feathers, claws, teeth, or bones of the totem aniumal. At your option, you also gain minior physical attributes that are reminiscent of your totem spirit. For example, if you have a bear totem spirit, you might be unusually hairy and thick-skinned, or if your totem is the eagle, your eyes turn bright yellow. Your totem animal might be an animal related to those listed here but more appropriate to your homeland.'],
    6=> ['Aspect of the Beast: You gain a magical benefit based on the totem animal of your choice.'],
    10=> ['Spirit Walker: You can cast the Commune With Nature spell as a ritual. When you do, a spiritual version of one of your totem animals appears to you to convey the information you seek.'],
    14=> ['Totemic Attunement: You gain a magical benefit based on the totem animal of your choice.']
  },
  leveled_choice: {
    3=> [
      'Bear: While raging, you have resistance to all damage except psychic damage. The spirit of the bear makes you tough enough to stand up to any punishment.',
      'Eagle: While you`re ragina and aren`t wearing heavy armor, other creatures have disadvantage on opportunity attack rolls against you, and you can use the Dash action as a bonus action on your turn. The spirit of the eagle makes you into a predator who can weave through the gray with ease.',
      'Wolf: While you`re raging, your friends have advantage on melee attack rolls against any creature within 5 feet of you that is hostile to you. The spirit of the wolf makes you a leader of hunters.',
    ],
    6=> [
      'Bear: You gain the might of a bear. your carrying capacity is doubled, and you have advantage on STR checks made to push, pull, lift, or break objects.',
      'Eagle: You gain the eyesight of an eagle. you can see up to 1 mile away with no difficulty, able to discern even fine details as though looking at something no more than 100 feet away from you. Additionally, dim light doesn`t impose disadvantage on your Wisdom(Perception) checks.',
      'Wolf: You gain the hunting sensibilities of a wolf. You can track other creatures while traveling at a fast pace, and you can move stealthily while traveling at a normal pace.',
    ],
    14=> [
      'Bear: While you`re raging, any creature within 5 feet of you that`s hostile to you has disadvantage on attack rolls against targets other than you or another character with this feature. An enemy is immune to this effect if it can`t see or hear you or if it can`t be frightened.',
      'Eagle: While raging, you have a flying speed equal to your current walking speed. This benefit works only in short bursts; you fall if you end your turn in the air and nothing else is holding you aloft.',
      'Wolf: While you`re raging, you can use a bonus action on your turn to knock a Large or smaller creature prone when you hit it with meleee weapon attack.',
    ],
  },
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=>[['Beast Sense','Ritual'],['Speak With Animals','Ritual']],
    10=>[['Commune With Nature','Ritual']],
    'stat'=>'None',
    'source'=>'Totem Warrior',
  },
  custom_mods: {},
)

Bard = PlayerClass.create(
  name: 'Bard',
  hit_die: 8,
  starting_hp: 8,
  saving_throws: [1,5],
  armor: ['Light'],
  weapons: ['Simple','Hand Crossbow','Longsword','Rapier','Shortsword'],
  tools: [],
  skill_choices: ['Acrobatics','Animal Handling','Arcana','Athletics','Deception','History','Insight','Intimidation','Investigation','Medicine','Nature','Perception','Performance','Persuasion','Religion','Sleight of Hand','Stealth','Survival'],
  num_skills: 3,
  equipment_choices: {
    'choices' => [
      ['Rapier#1','Longsword#1','simple#1'],
      ["Diplomat's Pack#1","Entertainer's Pack#1"],
      ['Lute#1','instrument#1'],
    ],
    'default' => ['Leather Armor#1','Dagger#1'],
  },
  spellcasting_ability: 6,
  spell_table: [
    [4,2,2,0,0,0,0,0,0,0,0],
    [5,2,3,0,0,0,0,0,0,0,0],
    [6,2,4,2,0,0,0,0,0,0,0],
    [7,3,4,3,0,0,0,0,0,0,0],
    [8,3,4,3,2,0,0,0,0,0,0],
    [9,3,4,3,3,0,0,0,0,0,0],
    [10,3,4,3,3,1,0,0,0,0,0],
    [11,3,4,3,3,2,0,0,0,0,0],
    [12,3,4,3,3,3,1,0,0,0,0],
    [14,4,4,3,3,3,2,0,0,0,0],
    [15,4,4,3,3,3,2,1,0,0,0],
    [15,4,4,3,3,3,2,1,0,0,0],
    [16,4,4,3,3,3,2,1,1,0,0],
    [18,4,4,3,3,3,2,1,1,0,0],
    [19,4,4,3,3,3,2,1,1,1,0],
    [19,4,4,3,3,3,2,1,1,1,0],
    [20,4,4,3,3,3,2,1,1,1,1],
    [22,4,4,3,3,3,3,1,1,1,1],
    [22,4,4,3,3,3,3,2,1,1,1],
    [22,4,4,3,3,3,3,2,2,1,1],
  ],
  wealth_die: 5,
  features: {
    1=>[
      "Spellcasting: You have learned to untangle and reshape the fabric of reality in harmony with your wishes and music. Your spells are part of your vast repertoire, magic that you can tune to different situations. Charisma is your Spellcasting Ability.",
      "Bardic Inspiration: You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6.
      Once within the next 10 minutes, the creature can roll the die and add it to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls before deciding to use the Bardic Inspiration die. Once it is rolled, it is lost and a creature can only have one Bardic Inspiration at a time.
      You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses after a long rest.
      The die becomes a d8 at 5th level, a d10 at 10th, and a d12 at 15th",
    ],
    2=>[
      "Jack of All Trades: You can add half your proficiency bonus, rounded down, to any ability check you make that doesn't already include your proficiency bonus.",
      "Song of Rest: You can use soothing music or oration to help revitalize your wounded allies during a short rest. If you or any friendly creatures who can hear your performance regain hit points at the end of the short rest by spending one or more Hit Dice, each of those creatures regains an extra 1d6 hit points.
      The extra hit points increase to 1d8 at 9th level, 1d10 at 13th, and 1d12 at 17th.",
    ],
    3=>[
      "Bard College: You delve into the advanced techniques of the bard college of your choice.",
      "Expertise: Choose two of your skill proficiencies. Your proficiency bonus is doubled for these proficiencies when you make an ability check.
      At 10th level, you can choose another two proficiencies to gain this benefit.",
    ],
    4=>[
      "Ability Score Increase:",
    ],
    5=>[
      "Font of Inspiration: You regain all epended uses of Bardic Inspiration on a short or long rest."
    ],
    6=>[
      "Countercharm: You gain the ability to use musical notes or words of power to disrupt mind-influencing effects. As an action, you can start a performance that lasts until the end of your next turn. During that time, you and any friendly creatures within 30 feet of you have advantage on saving throws against being frightened or charmed. A creature must be able to hear you to gain this benefit. The performance ends early if you are incapacitated or silenced or if you voluntarily end it (no action required)."
    ],
    8=>[
      "Ability Score Increase:",
    ],
    10=>[
      "Magical Secrets: You have plundered magical knowledge from a wide spectrum of disciplines. Choose two spells from any class, including this one. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip.
      The chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table.
      You learn two additional spells from any class at 14th, and 18th level."
    ],
    12=>[
      "Ability Score Increase:",
    ],
    16=>[
      "Ability Score Increase:",
    ],
    19=>[
      "Ability Score Increase:",
    ],
    20=>[
      "Superior Inspiration: When you roll initiative and have no uses of Bardic Inspiration left, you regain one use."
    ],
  },
  leveled_choice: {},
  extra_spells: {
    'Any'=> {
      'source'=> 'Magical Secrets',
      'spells_choices'=> [
        [10,2],
        [14,2],
        [18,2], #2 spells each at 10, 14 and 18th level
      ],
      'cantrips_choices'=> 0,
      'spell_ability'=> 'Charisma',
      'spells_are_extra'=> false,
    }
  },
  specific_spells: {},
  custom_mods: {},
)

Bard.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Bard.subclasses.create(
  name: "College of Lore",
  description: "Bards of the College of Lore know something about most things, collecting bits of knowledge from sources as diverse as scholarly tomes and peasant tales. Whether singing folk ballads in taverns or elaborate compositions in royal courts, these bards use their gifts to hold audiences spellbound.",
  features: {
    3=>[
      "Bonus Proficiencies: You gain 3 skill proficiencies of your choice.",
      "Cutting Words: You learn how to use your wit to distract, confuse, and otherwise sap the confidence and competence of others. When a creature that you can see within 60 feet of you makes an attack roll, an ability check, or a damage roll, you can use your reaction to expend one of your uses of Bardic Inspiration, rolling a Bardic Inspiration die and subtracting the number rolled from the creature's roll. You can choose to use this feature after the creature makes its roll, but before the DM determines whether the attack roll or ability check succeeds or fails, or before the creature deals its damage. The creature is immune if it can't hear you or if it's immune to being charmed.",
    ],
    6=>[
      "Magical Secrets: You learn two spells of your choice from any class. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip. The chosen spells count as bard spells for you but don't count against the number of bard spells you know.",
    ],
    14=>[
      "Peerless Skill: When you make an ability check, you can expend one use of Bardic Inspiration. Roll a Bardic Inspiration die and add the number rolled to your ability check. You can choose to do so after you roll the die for the ability check, but before the DM tells you whether you succeed or fail.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {
    'Any'=> {
      'source'=> 'College of Lore',
      'spells_choices'=> [
        [6,2], #2 choices at level 6
      ],
      'cantrips_choices'=> 0,
      'spell_ability'=> 'Charisma',
      'spells_are_extra'=> false,
    }
  },
  specific_spells: {},
  custom_mods: {
    'extra_profs'=> [
      [3,3],
    ]
  },
)

Bard.subclasses.create(
  name: "College of Valor",
  description: "Bards of the College of Valor are daring skalds whose tales keep alive the memory of the great heroes of the past, and thereby inspire a new generation of heroes. These bards gather in mead halls or around great bonfires to sing the deeds of the mighty, both past and present.",
  features: {
    3=>[
      "Bonus Proficiencies: You gain proficiency with medium armor, shields, and martial weapons.",
      "Combat Inspiration: You learn to inspire others in battle. A creature that has a Bardic Inspiration die from you can roll that die and add the number rolled to a weapon damage roll it just made. Alternatively, when an attack roll is made against the creature, it can use its reaction to roll the Bardic Inspiration die and add the number rolled to its AC against that attack, after seeing the roll but before knowing whether it hits or misses.",
    ],
    6=>[
      "Extra Attack: You can attack twice when you take the Attack action on your turn.",
    ],
    14=>[
      "Battle Magic: You have mastered the art of weaving spellcasting and weapon use into a single harmonious act. When you use your action to cast a bard spell, you can make one weapon attack as a bonus action.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  armor: ['Medium','Shields'],
  weapons: ['Martial'],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Cleric = PlayerClass.create(
  name: 'Cleric',
  hit_die: 8,
  starting_hp: 8,
  saving_throws: [4,5],
  armor: ['Light','Medium','Shields'],
  weapons: ['Simple'],
  tools: [],
  skill_choices: ['History','Insight','Medicine','Persuasion','Religion'],
  num_skills: 2,
  equipment_choices: {
    'choices' => [
      ['Mace#1','Warhammer#1'],
      ["Scale Mail#1","Leather Armor#1","Chain Mail#1"],
      ['Light Crossbow#1','simple#1'],
      ['Priest\'s Pack#1','Explorer\'s Pack#1'],
    ],
    'default' => ['Shield#1','Holy Emblem#1'],
  },
  spellcasting_ability: 5,
  spell_table: [
    [-1,3,2,0,0,0,0,0,0,0,0],
    [-1,3,3,0,0,0,0,0,0,0,0],
    [-1,3,4,2,0,0,0,0,0,0,0],
    [-1,4,4,3,0,0,0,0,0,0,0],
    [-1,4,4,3,2,0,0,0,0,0,0],
    [-1,4,4,3,3,0,0,0,0,0,0],
    [-1,4,4,3,3,1,0,0,0,0,0],
    [-1,4,4,3,3,2,0,0,0,0,0],
    [-1,4,4,3,3,3,1,0,0,0,0],
    [-1,5,4,3,3,3,2,0,0,0,0],
    [-1,5,4,3,3,3,2,1,0,0,0],
    [-1,5,4,3,3,3,2,1,0,0,0],
    [-1,5,4,3,3,3,2,1,1,0,0],
    [-1,5,4,3,3,3,2,1,1,0,0],
    [-1,5,4,3,3,3,2,1,1,1,0],
    [-1,5,4,3,3,3,2,1,1,1,0],
    [-1,5,4,3,3,3,2,1,1,1,1],
    [-1,5,4,3,3,3,3,1,1,1,1],
    [-1,5,4,3,3,3,3,2,1,1,1],
    [-1,5,4,3,3,3,3,2,2,1,1],
  ],
  wealth_die: 5,
  features: {
    1=>[
      "Spellcasting: As a conduit for divine power you can cast Cleric spells. Wisdom is your Spellcasting Stat for these spells.",
      "Spellcasting Focus: You can use a holy symbol or consecrated item as a spellcasting focus for your cleric spells.",
    ],
    2=>[
      "Channel Divinity - Turn Undead: As an action, you present your holy symbol and speak a prayer censuring the undead. Each undead that can see or hear you within 30 feet of you must make a Wisdom saving throw. If the creature fails its saving throw, it is turned for 1 minute or until it takes any damage.
      A turned creature must spend its turns trying to move as far away from you as it can, and it can't willingly move to a space within 30 feet of you. It also can't take reactions. For its action, it can use only the Dash action or try to escape from an effect that prevents it from moving. If there's nowhere to move, the creature can use the Dodge action.",
    ],
    4=>[
      "Ability Score Increase:",
    ],
    5=>[
      "Destroy Undead: Starting at 5th level, when an undead of CR 1/2 or lower fails its saving throw against your Turn Undead feature, the creature is instantly destroyed. The CR limit increases to 1 at 8th level, 2 at 11th, 3 at 14th, and 4 at 17th level."
    ],
    8=>[
      "Ability Score Increase:",
    ],
    10=>[
      "Divine Intervention: Beginning at 10th level, you can call on your deity to intervene on your behalf when your need is great.
      Imploring your deity's aid requires you to use your action. Describe the assistance you seek, and roll percentile dice. If you roll a number equal to or lower than your cleric level, your deity intervenes. The DM chooses the nature of the intervention; the effect of any cleric spell or cleric domain spell would be appropriate. If your deity intervenes, you can't use this feature again for 7 days. Otherwise, you can use it again after you finish a long rest.",
    ],
    12=>[
      "Ability Score Increase:",
    ],
    16=>[
      "Ability Score Increase:",
    ],
    19=>[
      "Ability Score Increase:",
    ],
    20=>[
      "Command the Gods: Your call for Diving Intervention succeeds automatically.",
    ],
  },
  leveled_choice: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Cleric.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Cleric.subclasses.create(
  name: "Knowledge Domain",
  description: "The gods of konwledge value learning and understanding above all. Followers of these gods study esoteric lore, collect old tomes, delve into the secret places of the earth, and learn all they can.",
  features: {
    1=>[
      "Blessings of Knowledge: You learn two languages, become proficient in 2 of Arcana, History, Nature, or Religion, and you have expertise in those skills.",
    ],
    2=>[
      "Knowledge of the Ages: You can use your Channel Divinity to tap into a divine well of knowledge. As an action, choose one skill or tool and you have proficiency with it for 10 minutes.",
    ],
    6=>[
      "Read Thoughts: You can use your Channel Divinity to read a creature's thoughts. You can then use your acces to its mind to command it.
      As an action, choose one creature that you can see within 60 feet of you. That creature must make a Wisdom saving throw. If the creature succeeds on the saving throw, you can't use this feature on it again until you finish a long rest.
      If the creature fails its save, you can read its surface thoughts (those foremost in its mind, reflecting its current emotions and what it is actively thinking about) when it is within 60 feet of you. This effect lasts for 1 minute.
      During that time, you can use your action to end this effect and cast the Suggestion spell on the creature without expending a spell slot. The target automatically fails its saving throw against the spell.",
    ],
    8=>[
      "Potent Spellcasting: You add your Wisdom modifier to the damage you deal with any cleric cantrip.",
    ],
    17=>[
      "Visions of the Past: You can call up visions of the past that relate to an object you hold or your immediate surroundings. You spend at least 1 minute in meditation and prayer, then receive dreamlike, shadowy glimpses of recent events. You can meditate in this way for a number of minutes equal to your Wisdom score and must maintain concentration during that time, as if you were casting a spell.
      Once you use this feature, you can't use it again until you finish a short or long rest."
    ],
  },
  extra_languages: 2,
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    1=>[['Command','Normal'],['Identify','Normal']],
    3=>[['Augury','Normal'],['Suggestion','Normal']],
    5=>[['Nondetection','Normal'],['Speak With the Dead','Normal']],
    7=>[['Arcane Eye','Normal'],['Confusion','Normal']],
    9=>[['Legend Lore','Normal'],['Scrying','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Knowledge Domain',
  },
  custom_mods: {
    'expertise_choices' => ['Arcana','Nature','History','Religion'],
    'num_expertise'=> 2,
    'expertise_source'=> 'Knowledge Domain',
  },
)

Cleric.subclasses.create(
  name: "Life Domain",
  description: "The Life domain focuses on the vibrant positive energy – one of the fundamental forces of the universe – that sustains all life. The gods of life promote vitality and health through healing the sick and wounded, caring for those in need, and driving away the forces of death and undeath.",
  features: {
    1=>[
      "Armor of God: You gain proficiency with heavy armor.",
      "Your healing spells are more effective. Whenever you use a spell of 1st level or higher to restore hit points to a creature, the creature regains additional hit points equal to 2 + the spell's level.",
    ],
    2=>[
      "Preserve Life: You can use your Channel Divinity to heal the badly injured.
      You present your holy symbol and evoke healing energy that can restore a number of hit points equal to five times your cleric level. Choose any creatures within 30 feet of you, and divide those hit points among them. This feature can restore a creature to no more than half of its hit point maximum. You can't use this feature on an undead or a construct.",
      ],
    6=>[
      "Blessed Healer: The healing spells you cast on others heal you as well. When you cast a spell of 1st level or higher that restores hit points to a creature other than you, you regain hit points equal to 2 + the spell's level.",
    ],
    8=>[
      "Divine Strike: You gain the ability to infuse your weapon strikes with divine energy. Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 radiant damage to the target. When you reach 14th level, the extra damage increases to 2d8.",
    ],
    17=>[
      "Supreme Healing: When you would normally roll one or more dice to restore hit points with a spell, you instead use the highest number possible for each die. For example, instead of restoring 2d6 hit points to a creature, you restore 12."
    ],
  },
  armor: ["Heavy"],
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    1=>[['Bless','Normal'],['Cure Wounds','Normal']],
    3=>[['Lesser Restoration','Normal'],['Spiritual Weapon','Normal']],
    5=>[['Beacon of Hope','Normal'],['Revivify','Normal']],
    7=>[['Death Ward','Normal'],['Guardian of Faith','Normal']],
    9=>[['Mass Cure Wounds','Normal'],['Raise Dead','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Life Domain',
  },
  custom_mods: {},
)

Cleric.subclasses.create(
  name: "Light Domain",
  description: "Gods of light, including Helm, Lathander, Pholtus, Branchala, the Silver Flame, Belenus, Apollo, and Re-Horakhty, promote the ideals of rebirth and renewal, truth, vigilance, and beauty, often using the symbol of the sun.",
  features: {
    1=> [
      "Holy Light: You gain the Light cantrip",
      "Warding Flare: You can interpose divine light between yourself and an attacking enemy. When you are attacked by a creature within 30 feet of you that you can see, you can use your reaction to impose disadvantage on the attack roll, causing light to flare before the attacker before it hits or misses. An attacker that can't be blinded is immune to this feature.

      You can use this feature a number of times equal to your Wisdom modifier (a minimum of once). You regain all expended uses when you finish a long rest",
    ],
    2=> [
      "Radiance of the Dawn: You can use your Channel Divinity to harness sunlight, banishing darkness and dealing radiant damage to your foes.

      As an action, you present your holy symbol, and any magical darkness within 30 feet of you is dispelled. Additionally, each hostile creature within 30 feet of you must make a Constitution saving throw. A creature takes radiant damage equal to 2d10 + your cleric level on a failed saving throw, and half as much damage on a successful one. A creature that has total cover from you is not affected.",
    ],
    6=> [
      "Improved Flare: You can also use your Warding Flare feature when a creature that you can see within 30 feet of you attacks a creature other than you.",
    ],
    8=> [
      "Potent Spellcasting: You add your Wisdom modifier to the damage you deal with any cleric cantrip.",
    ],
    17=> [
      "Corona of Light: You can use your action to activate an aura of sunlight that lasts for 1 minute or until you dismiss it using another action. You emit bright light in a 60-foot radius and dim light 30 feet beyond that. Your enemies in the bright light have disadvantage on saving throws against any spell that deals fire or radiant damage.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    1=>[['Burning Hands','Normal'],['Faerie Fire','Normal'],['Light','Cantrip']],
    3=>[['Flaming Sphere','Normal'],['Scorching Ray','Normal']],
    5=>[['Daylight','Normal'],['Fireball','Normal']],
    7=>[['Guardian of Faith','Normal'],['Wall of Fire','Normal']],
    9=>[['Flame Strike','Normal'],['Scrying','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Light Domain',
  },
  custom_mods: {},
)

Cleric.subclasses.create(
  name: "Nature Domain",
  description: "Gods of nature are as varied as the natural world itself; from inscrutable gods of the deep forests (such as Silvanus, Obad-Hai, Chislev, Balinor, and Pan) to friendly deities associated with particular springs and groves (such as Eldath). Druids revere nature as a whole and might serve one of these deities, but many of these gods have clerics as well. Champions who take a more active role in advancing the interests of a particular nature god. These clerics might hunt the evil monstrosities that despoil the woodlands, bless the harvest of the faithful, or wither the crops of those who anger their gods.",
  features: {
    1=> [
      "Acolyte of Nature: you learn one cantrip of your choice from the druid spell list. This cantrip counts as a cleric cantrip for you, but it doesn’t count against the number of cleric cantrips you know. You also gain proficiency in one of the following skills of your choice: Animal Handling, Nature, or Survival.",
      "Armor of God: you gain proficiency with heavy armor.",
    ],
    2=> [
      "Charm Animals and Plants: You can use your Channel Divinity to charm animals and plants.

      As an action, you present your holy symbol and invoke the name of your deity. Each beast or plant creature that can see you within 30 feet of you must make a Wisdom saving throw. If the creature fails its saving throw, it is charmed by you for 1 minute or until it takes damage. While it is charmed by you, it is friendly to you and other creatures you designate.",
    ],
    6=> [
      "Dampen Elements: When you or a creature within 30 feet of you takes acid, cold, fire, lightning, or thunder damage, you can use your reaction to grant resistance to the creature against that instance of the damage.",
    ],
    8=> [
      "Divine Strike: You gain the ability to infuse your weapon strikes with divine energy. Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 cold, fire, or lightning damage (your choice) to the target. When you reach 14th level, the extra damage increases to 2d8.",
    ],
    17=> [
      "Master of Nature: You gain the ability to command animals and plant creatures. While creatures are charmed by your Charm Animals and Plants feature, you can take a bonus action on your turn to verbally command what each of those creatures will do on its next turn.",
    ],
  },
  armor: ["Heavy"],
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {
    'Druid'=> {
      'source'=> 'Nature Domain',
      'spells_choices'=> [],
      'cantrips_choices'=> 1,
      'spell_ability'=> 'Wisdom',
      'spells_are_extra'=> true,
    }
  },
  specific_spells: {
    1=>[['Animal Friendship','Normal'],['Speak with Animals','Normal']],
    3=>[['Barkskin','Normal'],['Spike Growth','Normal']],
    5=>[['Plant Growth','Normal'],['Wind Wall','Normal']],
    7=>[['Dominate Beast','Normal'],['Grasping Vine','Normal']],
    9=>[['Insect Plague','Normal'],['Tree Stride','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Nature Domain',
  },
  custom_mods: {},
)

Cleric.subclasses.create(
  name: "Tempest Domain",
  description: "Tempest gods send their clerics to inspire fear in the common folk, either to keep those folk on the path of righteousness or to encourage them to offer sacrifices of propitiation to ward off divine wrath.",
  features: {
    1=> [
      "Divine Armament: You gain proficiency with martial weapons and heavy armor.",
      "Wrath of the Storm: You can thunderously rebuke attackers. When a creature within 5 feet of you that you can see hits you with an attack, you can use your reaction to cause the creature to make a Dexterity saving throw. The creature takes 2d8 lightning or thunder damage (your choice) on a failed saving throw, and half as much damage on a successful one.

      You can use this feature a number of times equal to your Wisdom modifier (a minimum of once). You regain all expended uses when you finish a long rest.",
    ],
    2=> [
      "Destructive Wrath: You can use your Channel Divinity to wield the power of the storm with unchecked ferocity.

      When you roll lightning or thunder damage, you can use your Channel Divinity to deal maximum damage, instead of rolling.",
    ],
    6=> [
      "Thunderous Strike: When you deal lightning damage to a Large or smaller creature, you can also push it up to 10 feet away from you.",
    ],
    8=> [
      "Divine Strike: You gain the ability to infuse your weapon strikes with divine energy. Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 thunder damage to the target. When you reach 14th level, the extra damage increases to 2d8.",
    ],
    17=> [
      "Stormborn: You have a flying speed equal to your current walking speed whenever you are not underground or indoors.",
    ],
  },
  weapons: ["Martial"],
  armor: ["Heavy"],
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    1=>[['Fog Cloud','Normal'],['Thunderwave','Normal']],
    3=>[['Gust of Wind','Normal'],['Shatter','Normal']],
    5=>[['Call Lightning','Normal'],['Sleet Storm','Normal']],
    7=>[['Control Water','Normal'],['Ice Storm','Normal']],
    9=>[['Destructive Wave','Normal'],['Insect Plague','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Tempest Domain',
  },
  custom_mods: {},
)

Cleric.subclasses.create(
  name: "Trickery Domain",
  description: "Gods of Trickery are mischief-makers and instigators who stand as a constant challenge to the accepted order among both gods and mortals. Their clerics are a disruptive force in the world, puncturing pride, mocking tyrants, stealing from the rich, freeing captives, and flouting hollow traditions. They prefer subterfuge, pranks, deception, and theft rather than direct confrontation.",
  features: {
    1=> [
      "Blessing of the Trickster: you can use your action to touch a willing creature other than yourself to give it advantage on Dexterity (Stealth) checks. This blessing lasts for 1 hour or until you use this feature again.",
    ],
    2=> [
      "Invoke Duplicity: You can use your Channel Divinity to create an illusory duplicate of yourself.

      As an action, you create a perfect illusion of yourself that lasts for 1 minute, or until you lose your concentration (as if you were concentrating on a spell). The illusion appears in an unoccupied space that you can see within 30 feet of you. As a bonus action on your turn, you can move the illusion up to 30 feet to a space you can see, but it must remain within 120 feet of you.

      For the duration, you can cast spells as though you were in the illusion's space, but you must use your own senses. Additionally, when both you and your illusion are within 5 feet of a creature that can see the illusion, you have advantage on attack rolls against that creature, given how distracting the illusion is to the target."
    ],
    6=> [
      "Cloak of Shadows: You can use your Channel Divinity to vanish.

      As an action, you become invisible until the end of your next turn. You become visible if you attack or cast a spell.",
    ],
    8=> [
      "Divine Strike: You gain the ability to infuse your weapon strikes with poison – a gift from your deity. Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 poison damage to the target. When you reach 14th level, the extra damage increases to 2d8.",
    ],
    17=> [
      "Improved Duplicity: You can create up to four duplicates of yourself, instead of one, when you use Invoke Duplicity. As a bonus action on your turn, you can move any number of them up to 30 feet, to a maximum range of 120 feet.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    1=>[['Charm Person','Normal'],['Disguise Self','Normal']],
    3=>[['Mirror Image','Normal'],['Pass Without Trace','Normal']],
    5=>[['Blink','Normal'],['Dispel Magic','Normal']],
    7=>[['Dimension Door','Normal'],['Polymorph','Normal']],
    9=>[['Dominate Person','Normal'],['Modify Memory','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Trickery Domain',
  },
  custom_mods: {},
)

Cleric.subclasses.create(
  name: "War Domain",
  description: "War has many manifestations. It can make heroes of ordinary people. It can be desperate and horrific, with acts of cruelty and cowardice eclipsing instances of excellence and courage. In either case, the gods of war watch over warriors and reward them for their great deeds. The clerics of such gods excel in battle, inspiring others to fight the good fight or offering acts of violence as prayers.",
  features: {
    1=> [
      "Divine Armament: You gain proficiency with martial weapons and heavy armor.",
      "War Priest: Your god delivers bolts of inspiration to you while you are engaged in battle. When you use the Attack action, you can make one weapon attack as a bonus action.

      You can use this feature a number of times equal to your Wisdom modifier (a minimum of once). You regain all expended uses when you finish a long rest.",
    ],
    2=> [
      "Guided Strike: You can use your Channel Divinity to strike with supernatural accuracy. When you make an attack roll, you can use your Channel Divinity to gain a +10 bonus to the roll. You make this choice after you see the roll, but before the DM says whether the attack hits or misses.",
    ],
    6=> [
      "War God's Blessing: When a creature within 30 feet of you makes an attack roll, you can use your reaction to grant that creature a +10 bonus to the roll, using your Channel Divinity. You make this choice after you see the roll, but before the DM says whether the attack hits or misses.",
    ],
    8=> [
      "Divine Strike: You gain the ability to infuse your weapon strikes with divine energy. Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 damage of the same type dealt by the weapon to the target. When you reach 14th level, the extra damage increases to 2d8.",
    ],
    17=> [
      "Avatar of Battle: You gain resistance to bludgeoning, piercing, and slashing damage from nonmagical attacks.",
    ],
  },
  weapons: ["Martial"],
  armor: ["Heavy"],
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    1=>[['Divine Favor','Normal'],['Shield of Faith','Normal']],
    3=>[['Magic Weapon','Normal'],['Spiritual Weapon','Normal']],
    5=>[["Crusader's Mantle",'Normal'],['Spirit Guardians','Normal']],
    7=>[['Freedom of Movement','Normal'],['Stoneskin','Normal']],
    9=>[['Flame Strike','Normal'],['Hold Monster','Normal']],
    'stat'=>'Wisdom',
    'source'=>'War Domain',
  },
  custom_mods: {},
)

Druid = PlayerClass.create(
  name: 'Druid',
  hit_die: 8,
  starting_hp: 8,
  saving_throws: [1,4],
  armor: ['Light','Medium','Shields'],
  weapons: ['Club','Dagger','Dart','Javelin','Mace','Quarterstaff','Scimitar','Sickle','Sling','Spear'],
  tools: ['Herbalism Kit'],
  skill_choices: ['Arcana','Animal Handling','Insight','Medicine','Nature','Perception','Religion','Survival'],
  num_skills: 2,
  equipment_choices: {
    'choices'=>[
      ['Wooden Shield#1','simple#1'],
      ['Scimitar#1','simple#1'],
    ],
    'default'=>['Leather Armor','Explorer\'s Pack','Yew Wand#1'],
  },
  spellcasting_ability: 5,
  spell_table: [
    [-1,2,2,0,0,0,0,0,0,0,0],
    [-1,2,3,0,0,0,0,0,0,0,0],
    [-1,2,4,2,0,0,0,0,0,0,0],
    [-1,3,4,3,0,0,0,0,0,0,0],
    [-1,3,4,3,2,0,0,0,0,0,0],
    [-1,3,4,3,3,0,0,0,0,0,0],
    [-1,3,4,3,3,1,0,0,0,0,0],
    [-1,3,4,3,3,2,0,0,0,0,0],
    [-1,3,4,3,3,3,1,0,0,0,0],
    [-1,4,4,3,3,3,2,0,0,0,0],
    [-1,4,4,3,3,3,2,1,0,0,0],
    [-1,4,4,3,3,3,2,1,0,0,0],
    [-1,4,4,3,3,3,2,1,1,0,0],
    [-1,4,4,3,3,3,2,1,1,0,0],
    [-1,4,4,3,3,3,2,1,1,1,0],
    [-1,4,4,3,3,3,2,1,1,1,0],
    [-1,4,4,3,3,3,2,1,1,1,1],
    [-1,4,4,3,3,3,3,1,1,1,1],
    [-1,4,4,3,3,3,3,2,1,1,1],
    [-1,4,4,3,3,3,3,2,2,1,1],
  ],
  wealth_die: 2,
  features: {
    1=>[
      "Druidic: You know the secret language of druids. You can speak the language and use it to leave hidden messages. You and others who know this language automatically spot such a message. Others spot the message's presence with a successful DC 15 Wisdom (Perception) check but can't decipher it without magic.",
      "Spellcasting: Drawing on the divine essence of nature itself, you can cast spells to shape that essence to your will.",
      "Spellcasting Focus: You can use a druidic focus as a spellcasting focus for your druid spells."
    ],
    2=>[
      "Wild Shape: You can use your action to magically assume the shape of a beast that you have seen before. You can use this feature twice. You regain expended uses when you finish a short or long rest.
      Your druid level determines the beasts you can transform into, as shown in the Beast Shapes table. At 2nd level, for example, you can transform into any beast that has a challenge rating of 1/4 or lower that doesn't have a flying or swimming speed.
      You can stay in a beast shape for a number of hours equal to half your druid level (rounded down). You then revert to your normal form unless you expend another use of this feature. You can revert to your normal form earlier by using a bonus action on your turn. You automatically revert if you fall unconscious, drop to 0 hit points, or die.",
    ],
    4=>[
      "Ability Score Increase:"
    ],
    8=>[
      "Ability Score Increase:",
    ],
    12=>[
      "Ability Score Increase:"
    ],
    16=>[
      "Ability Score Increase:"
    ],
    18=>[
      "Timeless Body: The primal magic that you wield causes you to age more slowly. For every 10 years that pass, your body ages only 1 year.",
      "Beast Spells: You can cast many of your druid spells in any shape you assume using Wild Shape. You can perform the somatic and verbal components of a druid spell while in a beast shape, but you aren't able to provide material components.",
    ],
    19=>[
      "Ability Score Increase:"
    ],
    20=>[
      "Archdruid: You can use your Wild Shape an unlimited number of times.
      Additionally, you can ignore the verbal and somatic components of your druid spells, as well as any material components that lack a cost and aren't consumed by a spell. You gain this benefit in both your normal shape and your beast shape from Wild Shape.",
    ],
  },
  leveled_choice: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Druid.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Moon",
  description: "Druids of the Circle of the Moon are fierce guardians of the wilds. Their order gathers under the full moon to share news and trade warnings. They haunt the deepest parts of the wilderness, where they might go for weeks on end before crossing paths with another humanoid creature, let alone another druid.",
  features: {
    2=>[
      "Combat Wild Shape: You gain the ability to use Wild Shape on your turn as a bonus action, rather than as an action.

      Additionally, while you are transformed by Wild Shape, you can use a bonus action to expend one spell slot to regain 1d8 hit points per level of the spell slot expended.",
      "Circle Forms: The rites of your circle grant you the ability to transform into more dangerous animal forms. Starting at 2nd level, you can use your Wild Shape to transform into a beast with a challenge rating as high as 1. You ignore the Max. CR column of the Beast Shapes table, but must abide by the other limitations there.

      Starting at 6th level, you can transform into a beast with a challenge rating as high as your druid level divided by 3, rounded down.",
    ],
    6=>[
      "Primal Strike: Your attacks in beast form count as magical for the purpose of overcoming resistance and immunity to nonmagical attacks and damage.",
    ],
    10=>[
      "Elemental Wild Shape: You can expend two uses of Wild Shape at the same time to transform into an air elemental, an earth elemental, a fire elemental, or a water elemental.",
    ],
    14=>[
      "Thousand Forms: You have learned to use magic to alter your physical form in more subtle ways. You can cast the Alter Self spell at will."
    ]
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    14=>[['Alter Self','Cantrip']],
    'stat'=>'Wisdom',
    'source'=>'Circle of the Moon',
  },
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Arctic",
  description: "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle’s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle’s mysterious rites.",
  features: {
    2=>[
      "Bonus Cantrip: You learn one additional druid cantrip.",
      "Natural Recovery: You can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can’t use this feature again until you finish a long rest.",
    ],
    6=>[
      "Land's Stride: Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.",
    ],
    10=>[
      "Nature's Ward: You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
    ],
    14=>[
      "Nature's Sanctuary: Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.
      The creature is aware of this effect before it makes its attack against you.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=>[['Hold Person','Normal'],['Spike Growth','Normal']],
    5=>[['Sleet Storm','Normal'],['Slow','Normal']],
    7=>[['Freedom of Movement','Normal'],['Ice Storm','Normal']],
    9=>[['Commune with Nature','Normal'],['Cone of Cold','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Circle of the Arctic',
  },
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Coast",
  description: "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle’s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle’s mysterious rites.",
  features: {
    2=>[
      "Bonus Cantrip: You learn one additional druid cantrip.",
      "Natural Recovery: You can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can’t use this feature again until you finish a long rest.",
    ],
    6=>[
      "Land's Stride: Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.",
    ],
    10=>[
      "Nature's Ward: You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
    ],
    14=>[
      "Nature's Sanctuary: Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.
      The creature is aware of this effect before it makes its attack against you.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=>[['Mirror Image','Normal'],['Misty Step','Normal']],
    5=>[['Water Breathing','Normal'],['Water Walk','Normal']],
    7=>[['Control Water','Normal'],['Freedom of Movement','Normal']],
    9=>[['Conjure Elemental','Normal'],['Scrying','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Circle of the Coast',
  },
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Desert",
  description: "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle’s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle’s mysterious rites.",
  features: {
    2=>[
      "Bonus Cantrip: You learn one additional druid cantrip.",
      "Natural Recovery: You can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can’t use this feature again until you finish a long rest.",
    ],
    6=>[
      "Land's Stride: Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.",
    ],
    10=>[
      "Nature's Ward: You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
    ],
    14=>[
      "Nature's Sanctuary: Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.
      The creature is aware of this effect before it makes its attack against you.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=>[['Blur','Normal'],['Silence','Normal']],
    5=>[['Create Food and Water','Normal'],['Protection from Energy','Normal']],
    7=>[['Blight','Normal'],['Hallucinatory Terrain','Normal']],
    9=>[['Insect Plague','Normal'],['Wall of Stone','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Circle of the Desert',
  },
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Forest",
  description: "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle’s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle’s mysterious rites.",
  features: {
    2=>[
      "Bonus Cantrip: You learn one additional druid cantrip.",
      "Natural Recovery: You can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can’t use this feature again until you finish a long rest.",
    ],
    6=>[
      "Land's Stride: Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.",
    ],
    10=>[
      "Nature's Ward: You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
    ],
    14=>[
      "Nature's Sanctuary: Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.
      The creature is aware of this effect before it makes its attack against you.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=>[['Barkskin','Normal'],['Spider Climb','Normal']],
    5=>[['Call Lightning','Normal'],['Plant Growth','Normal']],
    7=>[['Divination','Normal'],['Freedom of Movement','Normal']],
    9=>[['Commune with Nature','Normal'],['Tree Stride','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Circle of the Forest',
  },
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Grassland",
  description: "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle’s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle’s mysterious rites.",
  features: {
    2=>[
      "Bonus Cantrip: You learn one additional druid cantrip.",
      "Natural Recovery: You can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can’t use this feature again until you finish a long rest.",
    ],
    6=>[
      "Land's Stride: Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.",
    ],
    10=>[
      "Nature's Ward: You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
    ],
    14=>[
      "Nature's Sanctuary: Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.
      The creature is aware of this effect before it makes its attack against you.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=>[['Invisibility','Normal'],['Pass Without Trace','Normal']],
    5=>[['Daylight','Normal'],['Haste','Normal']],
    7=>[['Divination','Normal'],['Freedom of Movement','Normal']],
    9=>[['Dream','Normal'],['Insect Plague','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Circle of the Grassland',
  },
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Mountain",
  description: "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle’s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle’s mysterious rites.",
  features: {
    2=>[
      "Bonus Cantrip: You learn one additional druid cantrip.",
      "Natural Recovery: You can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can’t use this feature again until you finish a long rest.",
    ],
    6=>[
      "Land's Stride: Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.",
    ],
    10=>[
      "Nature's Ward: You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
    ],
    14=>[
      "Nature's Sanctuary: Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.
      The creature is aware of this effect before it makes its attack against you.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=>[['Spider Climb','Normal'],['Spike Growth','Normal']],
    5=>[['Lightning Bolt','Normal'],['Meld into Stone','Normal']],
    7=>[['Stone Shape','Normal'],['Stoneskin','Normal']],
    9=>[['Passwall','Normal'],['Wall of Stone','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Circle of the Mountain',
  },
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Swamp",
  description: "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle’s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle’s mysterious rites.",
  features: {
    2=>[
      "Bonus Cantrip: You learn one additional druid cantrip.",
      "Natural Recovery: You can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can’t use this feature again until you finish a long rest.",
    ],
    6=>[
      "Land's Stride: Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.",
    ],
    10=>[
      "Nature's Ward: You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
    ],
    14=>[
      "Nature's Sanctuary: Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.
      The creature is aware of this effect before it makes its attack against you.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=>[['Darkness','Normal'],["Melf's Acid Arrow",'Normal']],
    5=>[['Water Walk','Normal'],['Stinking Cloud','Normal']],
    7=>[['Freedom of Movement','Normal'],['Locate Creature','Normal']],
    9=>[['Insect Plague','Normal'],['Scrying','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Circle of the Swamp',
  },
  custom_mods: {},
)

Druid.subclasses.create(
  name: "Circle of the Underdark",
  description: "The Circle of the Land is made up of mystics and sages who safeguard ancient knowledge and rites through a vast oral tradition. These druids meet within sacred circles of trees or standing stones to whisper primal secrets in Druidic. The circle’s wisest members preside as the chief priests of communities that hold to the Old Faith and serve as advisors to the rulers of those folk. As a member of this circle, your magic is influenced by the land where you were initiated into the circle’s mysterious rites.",
  features: {
    2=>[
      "Bonus Cantrip: You learn one additional druid cantrip.",
      "Natural Recovery: You can regain some of your magical energy by sitting in meditation and communing with nature. During a short rest, you choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your druid level (rounded up), and none of the slots can be 6th level or higher. You can’t use this feature again until you finish a long rest.",
    ],
    6=>[
      "Land's Stride: Moving through nonmagical difficult terrain costs you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement, such those created by the entangle spell.",
    ],
    10=>[
      "Nature's Ward: You can't be charmed or frightened by elementals or fey, and you are immune to poison and disease.",
    ],
    14=>[
      "Nature's Sanctuary: Creatures of the natural world sense your connection to nature and become hesitant to attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.
      The creature is aware of this effect before it makes its attack against you.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=>[['Spider Climb','Normal'],['Web','Normal']],
    5=>[['Gaseous Form','Normal'],['Stinking Cloud','Normal']],
    7=>[['Greater Invisibility','Normal'],['Stone Shape','Normal']],
    9=>[['Cloudkill','Normal'],['Insect Plague','Normal']],
    'stat'=>'Wisdom',
    'source'=>'Circle of the Underdark',
  },
  custom_mods: {},
)

Fighter = PlayerClass.create(
  name: 'Fighter',
  hit_die: 10,
  starting_hp: 10,
  saving_throws: [0,2],
  armor: ['Light','Medium','Heavy','Shields'],
  weapons: ['Simple','Martial'],
  tools: [],
  skill_choices: ['Acrobatics','Animal Handling','Athletics','History','Insight','Intimidation','Perception','Survival'],
  num_skills: 2,
  equipment_choices: {
    'choices'=> [
      ['Chain Mail#1',['Leather Armor#1','Longbow#1','Arrows#1']],
      [['martial#1','Round Shield#1'],'martial#2'],
      [['Light Crossbow#1','Bolts#1'],'Handaxe#2'],
      ['Dungeoneer\'s Pack#1','Explorer\'s Pack#1'],
    ],
    'default'=> [],
  },
  wealth_die: 5,
  features: {
    1=> [
      "Second Wind: You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level. Once you use this feature, you must finish a short or long rest before you can use it again.",
    ],
    2=> [
      "Action Surge: You can push yourself beyond your normal limits for a moment. On your turn, you can take one additional action.
      Once you use this feature, you must finish a short or long rest before you can use it again.",
    ],
    4=>[
      "Ability Score Increase:",
    ],
    5=>[
      "Extra Attack: You can attack twice when you take the attack action on your turn.",
    ],
    6=>[
      "Ability Score Increase:",
    ],
    8=>[
      "Ability Score Increase:",
    ],
    9=>[
      "Indomitable: You can reroll a saving throw that you fail. If you do so, you must use the new roll, and you can’t use this feature again until you finish a long rest.",
    ],
    11=>[
      "Extra Attack: You can now attack three times when you take the attack action on your turn.",
    ],
    12=>[
      "Ability Score Increase:",
    ],
    13=>[
      "Indefatigable: You can use your Indomitable feature twice between long rests.",
    ],
    14=>[
      "Ability Score Increase:",
    ],
    16=>[
      "Ability Score Increase:",
    ],
    17=> [
      "Improved Action Surge: You can use your Action Surge twice before your rest, but only once per turn.",
      "Indeclinable: You can use your Indomitable feature three times between long rests.",
    ],
    19=>[
      "Ability Score Increase:",
    ],
    20=>[
      "Tetra-Strike: You can attack four times when you take the Attack action on your turn.",
    ],
  },
  leveled_choice: {
    1=> [
      "Archery: You gain a +2 bonus to attack rolls you make with ranged weapons.",
      "Defense: While you are wearing armor, you gain a +1 bonus to AC.",
      "Dueling: When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.",
      "Two-Weapon Fighting: When you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack.",
    ],
  },
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
  spellcasting_ability: 0,
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
  ],
)

Fighter.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Fighter.subclasses.create(
  name: "Battle Master",
  description: "Those who emulate the archetypal Battle Master employ martial techniques passed down through generations. To a Battle Master, combat is an academic field, sometimes including subjects beyond battle such as weaponsmithing and calligraphy. Not every fighter absorbs the lessons of history, theory, and artistry that are reflected in the Battle Master archetype, but those who do are well-rounded fighters of great skill and knowledge.",
  leveled_choice: {},
  equipment_choices: {
    'choices' => [
      ['artisan#1'],
    ],
    'default' => [],
  },
  features: {
    3=> [
      "Combat Superiority: you learn maneuvers that are fueled by special dice called superiority dice.

      Maneuvers. You learn three maneuvers of your choice. Many maneuvers enhance an attack in some way. You can use only one maneuver per attack. You learn two additional maneuvers of your choice at 7th, 10th, and 15th level. Each time you learn new maneuvers, you can also replace one maneuver you know with a different one.

      Superiority Dice. You have four superiority dice, which are d8s. A superiority die is expended when you use it. You regain all of your expended superiority dice when you finish a short or long rest. You gain another superiority die at 7th level and one more at 15th level.

      Saving Throws. Some of your maneuvers require your target to make a saving throw to resist the maneuver's effects. The saving throw DC is calculated as follows:

      Maneuver save DC = 8 + your proficiency bonus + your Strength or Dexterity modifier (your choice)",
      "Student of War: You gain proficiency with one type of artisan's tools of your choice.",
    ],
    7=> [
      "Know Your Enemy:  if you spend at least 1 minute observing or interacting with another creature outside combat, you can learn certain information about its capabilities compared to your own. The DM tells you if the creature is your equal, superior, or inferior in regard to two of the following characteristics of your choice:

      Strength score
      Dexterity score
      Constitution score
      Armor Class
      Current hit points
      Total class levels, if any
      Fighter class levels, if any",
    ],
    10=> [
      "Improved Combat Superiority: Your superiority dice turn into d10s. At 18th level, they turn into d12s.",
    ],
    15=> [
      "Relentless: When you roll initiative and have no superiority dice remaining, you regain 1 superiority die.",
    ],
  },
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'specialties'=> {
      'title'=> 'Maneuvers',
      'limits'=> [
        [3,3],
        [7,5],
        [10,7],
        [15,9]
      ],
      'list'=> [
        ['Ambush',"When you make a Dexterity (Stealth) check or an initiative roll, you can expend one superiority die and add the die to the roll, provided you aren't incapacitated."],
        ["Bait and Switch","When you're within 5 feet of a creature on your turn, you can expend one superiority die and switch places with that creature, provided you spend at least 5 feet of movement and the creature is willing and isn't incapacitated. This movement doesn't provoke opportunity attacks.

          Roll the superiority die. Until the start of your next turn, you or the other creature (your choice) gains a bonus to AC equal to the number rolled."],
        ["Brace","When a creature you can see moves into the reach you have with the melee weapon you're wielding, you can use your reaction to expend one superiority die and make one attack against the creature, using that weapon. If the attack hits, add the superiority die to the weapon's damage roll."],
        ["Commander's Strike","When you take the Attack action on your turn, you can forgo one of your attacks and use a bonus action to direct one of your companions to strike. When you do so, choose a friendly creature who can see or hear you and expend one superiority die. That creature can immediately use its reaction to make one weapon attack, adding the superiority die to the attack's damage roll."],
        ["Commanding Presence","When you make a Charisma (Intimidation), a Charisma (Performance), or a Charisma (Persuasion) check, you can expend one superiority die and add the superiority die to the ability check."],
        ["Disarming Attack","When you hit a creature with a weapon attack, you can expend one superiority die to attempt to disarm the target, forcing it to drop one item of your choice that it's holding. You add the superiority die to the attack's damage roll, and the target must make a Strength saving throw. On a failed save, it drops the object you choose. The object lands at its feet."],
        ["Distracting Strike","When you hit a creature with a weapon attack, you can expend one superiority die to distract the creature, giving your allies an opening. You add the superiority die to the attack's damage roll. The next attack roll against the target by an attacker other than you has advantage if the attack is made before the start of your next turn."],
        ["Evasive Footwork","When you move, you can expend one superiority die, rolling the die and adding the number rolled to your AC until you stop moving."],
        ["Feinting Attack","You can expend one superiority die and use a bonus action on your turn to feint, choosing one creature within 5 feet of you as your target. You have advantage on your next attack roll against that creature this turn. If that attack hits, add the superiority die to the attack's damage roll."],
        ["Goading Attack","When you hit a creature with a weapon attack, you can expend one superiority die to attempt to goad the target into attacking you. You add the superiority die to the attack's damage roll, and the target must make a Wisdom saving throw. On a failed save, the target has disadvantage on all attack rolls against targets other than you until the end of your next turn."],
        ["Grappling Strike","Immediately after you hit a creature with a melee attack on your turn, you can expend one superiority die and then try to grapple the target as a bonus action (see the Player's Handbook for rules on grappling). Add the superiority die to your Strength (Athletics) check."],
        ["Lunging Attack","When you make a melee weapon attack on your turn, you can expend one superiority die to increase your reach for that attack by 5 feet. If you hit, you add the superiority die to the attack's damage roll."],
        ["Maneuvering Attack","When you hit a creature with a weapon attack, you can expend one superiority die to maneuver one of your comrades into a more advantageous position. You add the superiority die to the attack's damage roll, and you choose a friendly creature who can see or hear you. That creature can use its reaction to move up to half its speed without provoking opportunity attacks from the target of your attack."],
        ["Menacing Attack","When you hit a creature with a weapon attack, you can expend one superiority die to attempt to frighten the target. You add the superiority die to the attack's damage roll, and the target must make a Wisdom saving throw. On a failed save, it is frightened of you until the end of your next turn."],
        ["Parry","When another creature damages you with a melee attack, you can use your reaction and expend one superiority die to reduce the damage by the number you roll on your superiority die + your Dexterity modifier."],
        ["Precision Attack","When you make a weapon attack roll against a creature, you can expend one superiority die to add it to the roll. You can use this maneuver before or after making the attack roll, but before any effects of the attack are applied."],
        ["Pushing Attack","When you hit a creature with a weapon attack, you can expend one superiority die to attempt to drive the target back. You add the superiority die to the attack's damage roll, and if the target is Large or smaller, it must make a Strength saving throw. On a failed save, you push the target up to 15 feet away from you."],
        ["Quick Toss","As a bonus action, you can expend one superiority die and make a ranged attack with a weapon that has the thrown property. You can draw the weapon as part of making this attack. If you hit, add the superiority die to the weapon's damage roll."],
        ["Rally","On your turn, you can use a bonus action and expend one superiority die to bolster the resolve of one of your companions. When you do so, choose a friendly creature who can see or hear you. That creature gains temporary hit points equal to the superiority die roll + your Charisma modifier."],
        ["Riposte","When a creature misses you with a melee attack, you can use your reaction and expend one superiority die to make a melee weapon attack against the creature. If you hit, you add the superiority die to the attack's damage roll."],
        ["Sweeping Attack","When you hit a creature with a melee weapon attack, you can expend one superiority die to attempt to damage another creature with the same attack. Choose another creature within 5 feet of the original target and within your reach. If the original attack roll would hit the second creature, it takes damage equal to the number you roll on your superiority die. The damage is of the same type dealt by the original attack."],
        ["Tactical Assessment","When you make an Intelligence (Investigation), an Intelligence (History), or a Wisdom (Insight) check, you can expend one superiority die and add the superiority die to the ability check."],
        ["Trip Attack","When you hit a creature with a weapon attack, you can expend one superiority die to attempt to knock the target down. You add the superiority die to the attack's damage roll, and if the target is Large or smaller, it must make a Strength saving throw. On a failed save, you knock the target prone."],
      ],
    },
    'dice'=> [
      {
        'title'=> 'Superiority Dice',
        'limits'=> [
          [3,4],
          [7,5],
          [15,6],
        ],
        'size'=> [
          [3,8],
        ],
      },
    ],
  },
)

Fighter.subclasses.create(
  name: "Champion",
  description: "The archetypal Champion focuses on the development of raw physical power honed to deadly perfection. Those who model themselves on this archetype combine rigorous training with physical excellence to deal devastating blows.",
  leveled_choice: {
    10=>[
      "Archery: You gain a +2 bonus to attack rolls you make with ranged weapons.",
      "Defense: While you are wearing armor, you gain a +1 bonus to AC.",
      "Dueling: When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.",
      "Two-Weapon Fighting: When you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack.",
    ],
  },
  features: {
    3=> [
      "Improved Critical: Your weapon attacks score a critical hit on a roll of 19 or 20.",
    ],
    7=> [
      "Remarkable Athlete: You can add half your proficiency bonus (round up) to any Strength, Dexterity, or Constitution check you make that doesn’t already use your proficiency bonus.
      In addition, when you make a running long jump, the distance you can cover increases by a number of feet equal to your Strength modifier.",
    ],
    10=> [
      "Fighting Style: You may choose a second option from the Fighting Style class feature.",
    ],
    15=> [
      "Superior Critical: Your weapon attacks score a critical hit on a roll of 18 or higher.",
    ],
    18=> [
      "Survivor: You attain the pinnacle of resilience in battle. At the start of each of your turns, you regain hit points equal to 5 + your Constitution modifier if you have no more than half of your hit points left. You don’t gain this benefit if you have 0 hit points.",
    ]
  },
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Fighter.subclasses.create(
  name: "Eldritch Knight",
  description: "The archetypal Eldritch Knight combines the martial mastery common to all fighters with a careful study of magic. Eldritch Knights use magical techniques similar to those practiced by wizards. They focus their study on two of the eight schools of magic: abjuration and evocation. Abjuration spells grant an Eldritch Knight additional protection in battle, and evocation spells deal damage to many foes at once, extending the fighter's reach in combat. These knights learn a comparatively small number of spells, committing them to memory instead of keeping them in a spellbook.",
  leveled_choice: {},
  equipment_choices: {},
  features: {
    3=> [
      "Spellcasting: You augment your martial prowess with the ability to cast spells.",
      "Spells Known: You know three 1st-level wizard spells of your choice, two of which you must choose from the abjuration and evocation spells on the wizard spell list.

      The Spells Known column of the Eldritch Knight Spellcasting table shows when you learn more wizard spells of 1st level or higher. Each of these spells must be an abjuration or evocation spell of your choice, and must be of a level for which you have spell slots. For instance, when you reach 7th level in this class, you can learn one new spell of 1st or 2nd level.

      The spells you learn at 8th, 14th, and 20th level can come from any school of magic.

      Whenever you gain a level in this class, you can replace one of the wizard spells you know with another spell of your choice from the wizard spell list. The new spell must be of a level for which you have spell slots, and it must be an abjuration or evocation spell, unless you're replacing the spell you gained at 3rd, 8th, 14th, or 20th level from any school of magic.",
      "Spellcasting Ability: Intelligence is your spellcasting ability for your wizard spells, since you learn your spells through study and memorization. You use your Intelligence whenever a spell refers to your spellcasting ability. In addition, you use your Intelligence modifier when setting the saving throw DC for a wizard spell you cast and when making an attack roll with one.

      Spell save DC = 8 + your proficiency bonus + your Intelligence modifier

      Spell attack modifier = your proficiency bonus + your Intelligence modifier",
      "Weapon Bond: you learn a ritual that creates a magical bond between yourself and one weapon. You perform the ritual over the course of 1 hour, which can be done during a short rest. The weapon must be within your reach throughout the ritual, at the conclusion of which you touch the weapon and forge the bond.

      Once you have bonded a weapon to yourself, you can't be disarmed of that weapon unless you are incapacitated. If it is on the same plane of existence, you can summon that weapon as a bonus action on your turn, causing it to teleport instantly to your hand.

      You can have up to two bonded weapons, but can summon only one at a time with your bonus action. If you attempt to bond with a third weapon, you must break the bond with one of the other two.",
    ],
    7=> [
      "War Magic: When you use your action to cast a cantrip, you can make one weapon attack as a bonus action.",
    ],
    10=> [
      "Eldritch Strike: You learn how to make your weapon strikes undercut a creature's resistance to your spells. When you hit a creature with a weapon attack, that creature has disadvantage on the next saving throw it makes against a spell you cast before the end of your next turn.",
    ],
    15=> [
      "Arcane Charge: You gain the ability to teleport up to 30 feet to an unoccupied space you can see when you use your Action Surge. You can teleport before or after the additional action.",
    ],
    18=> [
      "War Magic: When you use your action to cast a spell, you can make one weapon attack as a bonus action.",
    ]
  },
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'spell_table'=> [
      [0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0],
      [3,2,2,0,0,0,0,0,0,0,0],
      [4,2,3,0,0,0,0,0,0,0,0],
      [4,2,3,0,0,0,0,0,0,0,0],
      [4,2,3,0,0,0,0,0,0,0,0],
      [5,2,4,2,0,0,0,0,0,0,0],
      [6,2,4,2,0,0,0,0,0,0,0],
      [6,2,4,2,0,0,0,0,0,0,0],
      [7,3,4,3,0,0,0,0,0,0,0],
      [8,3,4,3,0,0,0,0,0,0,0],
      [8,3,4,3,0,0,0,0,0,0,0],
      [9,3,4,3,2,0,0,0,0,0,0],
      [10,3,4,3,2,0,0,0,0,0,0],
      [10,3,4,3,2,0,0,0,0,0,0],
      [11,3,4,3,3,0,0,0,0,0,0],
      [11,3,4,3,3,0,0,0,0,0,0],
      [11,3,4,3,3,0,0,0,0,0,0],
      [12,3,4,3,3,1,0,0,0,0,0],
      [13,3,4,3,3,1,0,0,0,0,0],
    ],
    'spell_stat'=> 4, #we dont count from zero on these because 0 is 'None
    'spell_list'=> 'Wizard',
  },
)

Monk = PlayerClass.create(
  name: 'Monk',
  hit_die: 8,
  starting_hp: 8,
  saving_throws: [0,1],
  armor: [],
  weapons: ['Simple','Shortsword'],
  skill_choices: ['Acrobatics','Athletics','History','Insight','Religion','Stealth'],
  num_skills: 2,
  wealth_die: 0,
  equipment_choices: {
    'choices'=>[
      ['Shortsword#1','simple#1'],
      ['Dungeoneer\'s Pack#1','Explorer\'s Pack#1'],
      ['artisan#1','instrument#1'],
    ],
    'default'=> ['Darts#1']
  },
  features: {
    1=>[
      "Unarmored Defense: While you have no armor equipped, your AC is 10 + your Dexterity modifier + your Wisdom modifier.",
      "Martial Arts: your practice of martial arts gives you mastery of combat styles that use unarmed strikes and monk weapons, which are shortswords and any simple melee weapons that don't have the two-handed or heavy property.

      You gain the following benefits while you are unarmed or wielding only monk weapons and you aren't wearing armor or wielding a shield:

      You can use Dexterity instead of Strength for the attack and damage rolls of your unarmed strikes and monk weapons.
      You can roll a d4 in place of the normal damage of your unarmed strike or monk weapon. This die changes as you gain monk levels, as shown in the Martial Arts column of the Monk table.
      When you use the Attack action with an unarmed strike or a monk weapon on your turn, you can make one unarmed strike as a bonus action. For example, if you take the Attack action and attack with a quarterstaff, you can also make an unarmed strike as a bonus action, assuming you haven't already taken a bonus action this turn.",
    ],
    2=>[
      "Ki:  your training allows you to harness the mystic energy of ki. Your access to this energy is represented by a number of ki points. Your monk level determines the number of points you have, as shown in the Ki Points column of the Monk table.

      You can spend these points to fuel various ki features. You start knowing three such features: Flurry of Blows, Patient Defense, and Step of the Wind. You learn more ki features as you gain levels in this class.

      When you spend a ki point, it is unavailable until you finish a short or long rest, at the end of which you draw all of your expended ki back into yourself. You must spend at least 30 minutes of the rest meditating to regain your ki points.

      Some of your ki features require your target to make a saving throw to resist the feature's effects. The saving throw DC is calculated as follows:

      Ki save DC = 8 + your proficiency bonus + your Wisdom modifier",

      "Flurry of Blows. Immediately after you take the Attack action on your turn, you can spend 1 ki point to make two unarmed strikes as a bonus action.",
      "Patient Defense. You can spend 1 ki point to take the Dodge action as a bonus action on your turn.",
      "Step of the Wind. You can spend 1 ki point to take the Disengage or Dash action as a bonus action on your turn, and your jump distance is doubled for the turn",
      "Unarmored Movement:  your speed increases by 10 feet while you are not wearing armor or wielding a shield. This bonus increases to 15 feet at 6th level, 20 at 10th, 25 at 14th, and 30 at 18th..

      At 9th level, you gain the ability to move along vertical surfaces and across liquids on your turn without falling during the move."
    ],
    3=>[
      "Deflect Missiles: You can use your reaction to deflect or catch the missile when you are hit by a ranged weapon attack. When you do so, the damage you take from the attack is reduced by 1d10 + your Dexterity modifier + your monk level.

      If you reduce the damage to 0, you can catch the missile if it is small enough for you to hold in one hand and you have at least one hand free. If you catch a missile in this way, you can spend 1 ki point to make a ranged attack with a range of 20/60 using the weapon or piece of ammunition you just caught, as part of the same reaction. You make this attack with proficiency, regardless of your weapon proficiencies, and the missile counts as a monk weapon for the attack.",
    ],
    4=>[
      "Ability Score Improvement: ",
      "Slow Fall: You can use your reaction when you fall to reduce any falling damage you take by an amount equal to five times your monk level.",
    ],
    5=>[
      "Extra Attack: You can attack twice, instead of once, whenever you take the Attack action on your turn.",
      "Stunning Strike: You can interfere with the flow of ki in an opponent's body. When you hit another creature with a melee weapon attack, you can spend 1 ki point to attempt a stunning strike. The target must succeed on a Constitution saving throw or be stunned until the end of your next turn.",
    ],
    6=>[
      "Ki-Empowered Strikes: When you miss with an attack roll, you can spend 1 to 3 ki points to increase your attack roll by 2 for each of these ki points you spend, potentially turning the miss into a hit.",
    ],
    7=>[
      "Evasion: Your instinctive agility lets you dodge out of the way of certain area effects, such as a blue dragon's lightning breath or a fireball spell. When you are subjected to an effect that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed on the saving throw, and only half damage if you fail.",
      "Stillness of Mind: You can use your action to end one effect on yourself that is causing you to be charmed or frightened.",
    ],
    8=>[
      "Ability Score Increase:"
    ],
    10=>[
      "Purity of Body: Your mastery of the ki flowing through you makes you immune to disease and poison.",
    ],
    13=>[
      "Tongue of the Sun and Moon: You learn to touch the ki of other minds so that you understand all spoken languages. Moreover, any creature that can understand a language can understand what you say.",
    ],
    14=>[
      "Diamond Soul: Your mastery of ki grants you proficiency in all saving throws.

      Additionally, whenever you make a saving throw and fail, you can spend 1 ki point to reroll it and take the second result.",
    ],
    15=>[
      "Timeless Body: Your ki sustains you so that you suffer none of the frailty of old age, and you can't be aged magically. You can still die of old age, however. In addition, you no longer need food or water.",
    ],
    18=>[
      "Empty Body: You can use your action to spend 4 ki points to become invisible for 1 minute. During that time, you also have resistance to all damage but force damage.

      Additionally, you can spend 8 ki points to cast the astral projection spell, without needing material components. When you do so, you can't take any other creatures with you.",
    ],
    20=>[
      "Perfect Self: When you roll for initiative and have no ki points remaining, you regain 4 ki points.",
    ],
  },
  leveled_choice: {},
  custom_mods: {
    'dice'=> [
      {
        'title'=> 'Martial Die',
        'limits'=> [
          [1,1],
        ],
        'size'=> [
          [1,4],
          [5,6],
          [11,8],
          [17,10],
        ],
      },
    ],

    'points'=> {
      'name'=> 'Ki Points',
      '2'=> 2,
      '3'=> 3,
      '4'=> 4,
      '5'=> 5,
      '6'=> 6,
      '7'=> 7,
      '8'=> 8,
      '9'=> 9,
      '10'=> 10,
      '11'=> 11,
      '12'=> 12,
      '13'=> 13,
      '14'=> 14,
      '15'=> 15,
      '16'=> 16,
      '17'=> 17,
      '18'=> 18,
      '19'=> 19,
      '20'=> 20,
    },
  },
  spellcasting_ability: 0,
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
  ],
  extra_spells: {},
  specific_spells: {},
)

Monk.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Monk.subclasses.create(
  name: "Way of the Open Hand",
  description: "Monks of the Way of the Open Hand are the ultimate masters of martial arts combat, whether armed or unarmed. They learn techniques to push and trip their opponents, manipulate ki to heal damage to their bodies, and practice advanced meditation that can protect them from harm.",
  leveled_choice: {},
  features: {
    3=> [
      "Way of the Open Hand: You can manipulate your enemy’s ki when you harness your own. Whenever you hit a creature with one of the attacks granted by your Flurry of Blows, you can impose one of the following effects on that target:

      It must succeed on a Dexterity saving throw or be knocked prone.
      It must make a Strength saving throw. If it fails, you can push it up to 15 feet away from you.
      It can’t take reactions until the end of your next turn.",
    ],
    6=> [
      "Wholeness of Body: You gain the ability to heal yourself. As an action, you can regain hit points equal to three times your monk level. You must finish a long rest before you can use this feature again.",
    ],
    11=> [
      "Tranquility: You can enter a special meditation that surrounds you with an aura of peace. At the end of a long rest, you gain the effect of a sanctuary spell that lasts until the start of your next long rest (the spell can end early as normal). The saving throw DC for the spell equals 8 + your Wisdom modifier + your proficiency bonus.",
    ],
    17=> [
      "Quivering Palm: You gain the ability to set up lethal vibrations in someone’s body. When you hit a creature with an unarmed strike, you can spend 3 ki points to start these imperceptible vibrations, which last for a number of days equal to your monk level. The vibrations are harmless unless you use your action to end them. To do so, you and the target must be on the same plane of existence. When you use this action, the creature must make a Constitution saving throw. If it fails, it is reduced to 0 hit points. If it succeeds, it takes 10d10 necrotic damage.",
    ],
  },
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Monk.subclasses.create(
  name: "Way of the Four Elements",
  description: "You follow a monastic tradition that teaches you to harness the elements. When you focus your ki, you can align yourself with the forces of creation and bend the four elements to your will, using them as an extension of your body. Some members of this tradition dedicate themselves to a single element, but others weave the elements together.",
  leveled_choice: {},
  features: {
    3=> [
      "Way of the Four Elements: you learn magical disciplines that harness the power of the four elements. A discipline requires you to spend ki points each time you use it.

      You know the Elemental Attunement discipline and one other elemental discipline of your choice. You learn one additional elemental discipline of your choice at 6th, 11th, and 17th level.

      Whenever you learn a new elemental discipline, you can also replace one elemental discipline that you already know with a different discipline.

      Once you reach 5th level in this class, you can spend additional ki points to increase the level of an elemental discipline spell that you cast, provided that the spell has an enhanced effect at a higher level, as Burning Hands does. The spell's level increases by 1 for each additional ki point you spend. For example, if you are a 5th-level monk and use Sweeping Cinder Strike to cast Burning Hands, you can spend 3 ki points to cast it as a 2nd-level spell (the discipline's base cost of 2 ki points plus 1).

  The maximum number of ki points you can spend to cast a spell in this way (including its base ki point cost and any additional ki points you spend to increase its level) is determined by your monk level, as shown in the Spells and Ki Points table.",
    ],
  },
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'level_gated_collection'=> {
      'title'=> "Elemental Attunements",
      'levels'=> [
        [3,1],
        [6,2],
        [11,3],
        [17,4],
      ],
      'defaults'=> [
        'Elemental Attunement',
      ],
      'options'=> {
        'Breath of Winter'=> [17, "You can spend 6 ki points to cast Cone of Cold",["Cone of Cold",]],
        'Elemental Attunement'=> [
          3,
          "You can use your action to briefly control elemental forces within 30 feet of you, causing one of the following effects of your choice:

          Create a harmless, instantaneous sensory effect related to air, earth, fire, or water such as a shower of sparks, a puff of wind, a spray of light mist, or a gentle rumbling of stone.
          Instantaneously light or snuff out a candle, a torch, or a small campfire.
          Chill or warm up to 1 pound of nonliving material for up to 1 hour.
          Cause earth, fire, water, or mist that can fit within a 1-foot cube to shape itself into a crude form you designate for 1 minute.",
          [],
        ],
        "Eternal Mountain Defense"=> [17, "You can spend 5 ki points to cast Stoneskin, targeting yourself.", ["Stoneskin"]],
        "Fangs of the Fire Snake"=> [3, "When you use the Attack action on your turn, you can spend 1 ki point to cause tendrils of flame to stretch out from your fists and feet. Your reach with your unarmed strikes increases by 10 feet for that action, as well as the rest of the turn. A hit with such an attack deals fire damage instead of bludgeoning damage, and if you spend 1 ki point when the attack hits, it also deals an extra 1d10 fire damage.", []],
        "Fist of Four Thunders"=> [3, "You can spend 2 ki points to cast Thunderwave.",['Thunderwave']],
        "Fist of Unbroken Air"=> [3, "You can create a blast of compressed air that strikes like a mighty fist. As an action, you can spend 2 ki points and choose a creature within 30 feet of you. That creature must make a Strength saving throw. On a failed save, the creature takes 3d10 bludgeoning damage, plus an extra 1d10 bludgeoning damage for each additional ki point you spend, and you can push the creature up to 20 feet away from you and knock it prone. On a successful save, the creature takes half as much damage, and you don't push it or knock it prone.", [],],
        "Flames of the Phoenix"=> [11, "You can spend 4 ki points to cast Fireball", ["Fireball"]],
        "Gong of the Summit"=> [6, "You can spend 3 ki points to cast Shatter", ["Shatter"]],
        "Mist Stance"=> [11, "You can spend 4 ki points to cast Gaseous Form, targeting yourself.", ["Gaseous Form"]],
        "Ride the Wind"=> [11, "You can spend 4 ki points to cast Fly, targeting yourself.", ["Fly"]],
        "River of Hungry Flame"=> [17, "You can spend 5 ki points to cast Wall of Fire.", ["Wall of Fire"]],
        "Rush of the Gale Spirits"=> [3, "You can spend 2 ki points to cast Gust of Wind.", ["Gust of Wind"]],
        "Shape the Flowing River"=> [3, "As an action, you can spend 1 ki point to choose an area of ice or water no larger than 30 feet on a side within 120 feet of you. You can change water to ice within the area and vice versa, and you can reshape ice in the area in any manner you choose. You can raise or lower the ice's elevation, create or fill in a trench, erect or flatten a wall, or form a pillar. The extent of any such changes can't exceed half the area's largest dimension. For example, if you affect a 30-foot square, you can create a pillar up to 15 feet high, raise or lower the square's elevation by up to 15 feet, dig a trench up to 15 feet deep, and so on. You can't shape the ice to trap or injure a creature in the area.", []],
        "Sweeping Cinder Strike"=> [3, "You can spend 2 ki points to cast Burning Hands.", ["Burning Hands"]],
        "Water Whip"=> [3, "You can spend 2 ki points as an action to create a whip of water that shoves and pulls a creature to unbalance it. A creature that you can see that is within 30 feet of you must make a Dexterity saving throw. On a failed save, the creature takes 3d10 bludgeoning damage, plus an extra 1d10 bludgeoning damage for each additional ki point you spend, and you can either knock it prone or pull it up to 25 feet closer to you. On a successful save, the creature takes half as much damage, and you don't pull it or knock it prone.", []],
        "Wave of Rolling Earth"=> [17, "You can spend 6 ki points to cast Wall of Stone.", ["Wall of Stone"]]
      },
    },
  },
)

Monk.subclasses.create(
  name: "Way of Shadow",
  description: "Monks of the Way of Shadow follow a tradition that values stealth and subterfuge. These monks might be called ninjas or shadowdancers, and they serve as spies and assassins. Sometimes the members of a ninja monastery are family members, forming a clan sworn to secrecy about their arts and missions. Other monasteries are more like thieves' guilds, hiring out their services to nobles, rich merchants, or anyone else who can pay their fees.",
  leveled_choice: {},
  features: {
    3=> [
      "Shadow Arts: You can use your ki to duplicate the effects of certain spells. As an action, you can spend 2 ki points to cast darkness, darkvision, pass without trace, or silence, without providing material components. Additionally, you gain the minor illusion cantrip if you don't already know it.",
    ],
    6=> [
      "Shadow Step: You gain the ability to step from one shadow into another. When you are in dim light or darkness, as a bonus action you can teleport up to 60 feet to an unoccupied space you can see that is also in dim light or darkness. You then have advantage on the first melee attack you make before the end of the turn.",
    ],
    11=> [
      "Cloak of Shadows: You have learned to become one with the shadows. When you are in an area of dim light or darkness, you can use your action to become invisible. You remain invisible until you make an attack, cast a spell, or are in an area of bright light.",
    ],
    17=> [
      "Oportunist:  you can exploit a creature's momentary distraction when it is hit by an attack. Whenever a creature within 5 feet of you is hit by an attack made by a creature other than you, you can use your reaction to make a melee attack against that creature.",
    ],
  },
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=> [
      ['Minor Illusion', 'Cantrip'],
      ['Darkness','Normal'],
      ['Darkvision','Normal'],
      ['Pass Without Trace','Normal'],
      ['Silence','Normal'],
    ],
    'stat'=> 'Wisdom',
    'source'=> 'Way of Shadow',
  },
  custom_mods: {},
)

Paladin = PlayerClass.create(
  name: 'Paladin',
  hit_die: 10,
  starting_hp: 10,
  saving_throws: [4,5],
  armor: ['Light','Medium','Heavy','Shields'],
  weapons: ['Simple','Martial'],
  tools: [],
  skill_choices: ['Athletics','Insight','Intimidation','Medicine','Persuasion','Religion'],
  num_skills: 2,
  equipment_choices: {
    'choices'=>[
      [['martial#1', 'Round Shield#1'],'martial#2'],
      ['Javelin#5','simple#1'],
      ["Priest's Pack#1","Explorer's Pack#1"],
    ],
    'default'=>['Chain Mail#1','Holy Emblem#1'],
  },
  spellcasting_ability: 6,
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [2,0,2,0,0,0,0,0,0,0,0],
    [3,0,3,0,0,0,0,0,0,0,0],
    [3,0,3,0,0,0,0,0,0,0,0],
    [4,0,4,2,0,0,0,0,0,0,0],
    [4,0,4,2,0,0,0,0,0,0,0],
    [5,0,4,3,0,0,0,0,0,0,0],
    [5,0,4,3,0,0,0,0,0,0,0],
    [6,0,4,3,2,0,0,0,0,0,0],
    [6,0,4,3,2,0,0,0,0,0,0],
    [7,0,4,3,3,0,0,0,0,0,0],
    [7,0,4,3,3,0,0,0,0,0,0],
    [8,0,4,3,3,1,0,0,0,0,0],
    [8,0,4,3,3,1,0,0,0,0,0],
    [9,0,4,3,3,2,0,0,0,0,0],
    [9,0,4,3,3,2,0,0,0,0,0],
    [10,0,4,3,3,3,1,0,0,0,0],
    [10,0,4,3,3,3,1,0,0,0,0],
    [11,0,4,3,3,3,2,0,0,0,0],
    [11,0,4,3,3,3,2,0,0,0,0],
  ],
  wealth_die: 5,
  features: {
    1=>[
      "Divine Sense: The presence of strong evil registers on your senses like a noxious odor, and powerful good rings like heavenly music in your ears. As an action, you can open your awareness to detect such forces. Until the end of your next turn, you know the location of any celestial, fiend, or undead within 60 feet of you that is not behind total cover. You know the type (celestial, fiend, or undead) of any being whose presence you sense, but not its identity (the vampire Count Strahd von Zarovich, for instance). Within the same radius, you also detect the presence of any place or object that has been consecrated or desecrated, as with the Hallow spell.

      You can use this feature a number of times equal to 1 + your Charisma modifier. When you finish a long rest, you regain all expended uses.",
      "Lay on Hands: Your blessed touch can heal wounds. You have a pool of healing power that replenishes when you take a long rest. With that pool, you can restore a total number of hit points equal to your paladin level x 5.

      As an action, you can touch a creature and draw power from the pool to restore a number of hit points to that creature, up to the maximum amount remaining in your pool.

      Alternatively, you can expend 5 hit points from your pool of healing to cure the target of one disease or neutralize one poison affecting it. You can cure multiple diseases and neutralize multiple poisons with a single use of Lay on Hands, expending hit points separately for each one.",
    ],
    2=>[
      "Fighting Style: You adopt a particular style of fighting as your specialty. You can't take a Fighting Style option more than once, even if you later get to choose again.",
      "Spellcasting: You have learned to draw on divine magic through meditation and prayer to cast spells as a cleric does.

      You prepare the list of paladin spells that are available for you to cast, choosing from the paladin spell list. When you do so, choose a number of paladin spells equal to your Charisma modifier + half your paladin level, rounded down (minimum of one spell). The spells must be of a level for which you have spell slots.

      You can change your list of prepared spells when you finish a long rest. Preparing a new list of paladin spells requires time spent in prayer and meditation: at least 1 minute per spell level for each spell on your list.",
      "Divine Smite: when you hit a creature with a melee weapon attack, you can expend one spell slot to deal radiant damage to the target, in addition to the weapon's damage. The extra damage is 2d8 for a 1st-level spell slot, plus 1d8 for each spell level higher than 1st, to a maximum of 5d8. The damage increases by 1d8 if the target is an undead or a fiend, to a maximum of 6d8.",
    ],
    3=>[
      "Divine Health: the divine magic flowing through you makes you immune to disease.",
      "Sacred Oath: You swear the oath that binds you as a paladin forever. Up to this time you have been in a preparatory stage, committed to the path but not yet sworn to it.",
    ],
    4=>[
      "Ability Score Increase:"
    ],
    5=>[
      "Extra Attack: You can attack twice, instead of once, whenever you take the Attack action on your turn.",
    ],
    6=>[
      "Aura of Protection: whenever you or a friendly creature within 10 feet of you must make a saving throw, the creature gains a bonus to the saving throw equal to your Charisma modifier (with a minimum bonus of +1). You must be conscious to grant this bonus.

      At 18th level, the range of this aura increases to 30 feet.",
    ],
    8=>[
      "Ability Score Increase:"
    ],
    10=>[
      "Aura of Courage: You and friendly creatures within 10 feet of you can't be frightened while you are conscious.

      At 18th level, the range of this aura increases to 30 feet.",
    ],
    11=>[
      "Improved Divine Smite: you are so suffused with righteous might that all your melee weapon strikes carry divine power with them. Whenever you hit a creature with a melee weapon, the creature takes an extra 1d8 radiant damage.",
    ],
    12=>[
      "Ability Score Increase:"
    ],
    14=>[
      "Cleansing Touch: you can use your action to end one spell on yourself or on one willing creature that you touch.

      You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain expended uses when you finish a long rest.",
    ],
    16=>[
      "Ability Score Increase:"
    ],
    19=>[
      "Ability Score Increase:"
    ],
  },
  leveled_choice: {
    2=> [
      "Blind Fighting: You have blindsight with a range of 10 feet. Within that range, you can effectively see anything that isn't behind total cover, even if you're blinded or in darkness. Moreover, you can see an invisible creature within that range, unless the creature successfully hides from you.",
      "Defense: While you are wearing armor, you gain a +1 bonus to AC.",
      "Dueling: When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.",
      "Great Weapon Fighting: When you roll a 1 or 2 on a damage die for an attack you make with a melee weapon that you are wielding with two hands, you can reroll the die and must use the new roll, even if the new roll is a 1 or a 2. The weapon must have the two-handed or versatile property for you to gain this benefit.",
      "Protection: When a creature you can see attacks a target other than you that is within 5 feet of you, you can use your reaction to impose disadvantage on the attack roll. You must be wielding a shield.",
      "Tunnel Fighter: As a bonus action, you can enter a defensive stance that lasts until the start of your next turn. While in your defensive stance, you can make opportunity attacks without using your reaction, and you can use your reaction to make a melee attack against a creature that moves more than 5 feet while within your reach.",
    ]
  },
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Paladin.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Paladin.subclasses.create(
  name: "Oath of the Ancients",
  description: "The Oath of the Ancients is as old as the race of elves and the rituals of the druids. Sometimes called fey knights, green knights, or horned knights, paladins who swear this oath cast their lot with the side of the light in the cosmic struggle against darkness because they love the beautiful and life-giving things of the world, not necessarily because they believe in principles of honor, courage, and justice. They adorn their armor and clothing with images of growing things-leaves, antlers, or flowers-to reflect their commitment to preserving life and light in the world.",
  leveled_choice: {
    3=>[
      "Nature's Wrath: You can use your Channel Divinity to invoke primeval forces to ensnare a foe. As an action, you can cause spectral vines to spring up and reach for a creature within 10 feet of you that you can see. The creature must succeed on a Strength or Dexterity saving throw (its choice) or be restrained. While restrained by the vines, the creature repeats the saving throw at the end of each of its turns. On a success, it frees itself and the vines vanish.",
      "Turn the Faithless: You can use your Channel Divinity to utter ancient words that are painful for fey and fiends to hear. As an action, you present your holy symbol, and each fey or fiend within 30 feet of you that can hear you must make a Wisdom saving throw. On a failed save, the creature is turned for 1 minute or until it takes damage.

      A turned creature must spend its turns trying to move as far away from you as it can, and it can't willingly move to a space within 30 feet of you. It also can't take reactions. For its action, it can use only the Dash action or try to escape from an effect that prevents it from moving. If there's nowhere to move, the creature can use the Dodge action.

      If the creature's true form is concealed by an illusion, shapeshifting, or other effect, that form is revealed while it is turned.",
    ],
  },
  equipment_choices: {},
  features: {
    7=> [
      "Aura of Warding: Ancient magic lies so heavily upon you that it forms an eldritch ward. You and friendly creatures within 10 feet of you have resistance to damage from spells. At 18th level, the range of this aura increases to 30 feet.",
    ],
    15=> [
      "Undying Sentinel: when you are reduced to 0 hit points and are not killed outright, you can choose to drop to 1 hit point instead. Once you use this ability, you can't use it again until you finish a long rest.

      Additionally, you suffer none of the drawbacks of old age, and you can't be aged magically.",
    ],
    20=> [
      "Elder Champion: You can assume the form of an ancient force of nature, taking on an appearance you choose. For example, your skin might turn green or take on a bark-like texture, your hair might become leafy or moss-like, or you might sprout antlers or a lion-like mane.

      Using your action, you undergo a transformation. For 1 minute, you gain the following benefits:

      At the start of each of your turns, you regain 10 hit points.
      Whenever you cast a paladin spell that has a casting time of 1 action, you can cast it using a bonus action instead.
      Enemy creatures within 10 feet of you have disadvantage on saving throws against your paladin spells and Channel Divinity options.
      Once you use this feature, you can't use it again until you finish a long rest.",
    ],
  },
  extra_spells: {},
  specific_spells: {
    3=> [
      ['Ensnaring Strike','Normal'],
      ['Speak with Animals','Normal'],
    ],
    5=> [
      ['Moonbeam','Normal'],
      ['Misty Step','Normal'],
    ],
    9=> [
      ['Plant Growth','Normal'],
      ['Protection from Energy','Normal'],
    ],
    13=> [
      ['Ice Storm','Normal'],
      ['Stoneskin','Normal'],
    ],
    17=> [
      ['Commune with Nature','Normal'],
      ['Tree Stride','Normal'],
    ],
    'stat'=> 'Charisma',
    'source'=> 'Oath of the Ancients',
  },
  custom_mods: {},
)

Paladin.subclasses.create(
  name: "Oath of Devotion",
  description: "The Oath of Devotion binds a paladin to the loftiest ideals of justice, virtue, and order. Sometimes called cavaliers, white knights, or holy warriors, these paladins meet the ideal of the knight in shining armor, acting with honor in pursuit of justice and the greater good. They hold themselves to the highest standards of conduct, and some, for better or worse, hold the rest of the world to the same standards. Many who swear this oath are devoted to gods of law and good and use their gods' tenets as the measure of their devotion.",
  leveled_choice: {
    3=>[
      "Sacred Weapon: As an action, you can imbue one weapon that you are holding with positive energy, using your Channel Divinity. For 1 minute, you add your Charisma modifier to attack rolls made with that weapon (with a minimum bonus of +1). The weapon also emits bright light in a 20-foot radius and dim light 20 feet beyond that. If the weapon is not already magical, it becomes magical for the duration.

      You can end this effect on your turn as part of any other action. If you are no longer holding or carrying this weapon, or if you fall unconscious, this effect ends.",
      "Turn the Unholy: As an action, you present your holy symbol and speak a prayer censuring fiends and undead, using your Channel Divinity. Each fiend or undead that can see or hear you within 30 feet of you must make a Wisdom saving throw. If the creature fails its saving throw, it is turned for 1 minute or until it takes damage.

      A turned creature must spend its turns trying to move as far away from you as it can, and it can't willingly move to a space within 30 feet of you. It also can't take reactions. For its action, it can use only the Dash action or try to escape from an effect that prevents it from moving. If there's nowhere to move, the creature can use the Dodge action.",
    ],
  },
  equipment_choices: {},
  features: {
    7=> [
      "Aura of Devotion: You and friendly creatures within 10 feet of you can't be charmed while you are conscious. At 18th level, the range of this aura increases to 30 feet.",
    ],
    15=> [
      "Purity of Spirit: You are always under the effects of a Protection from Evil and Good spell.",
    ],
    20=> [
      "Holy Nimbus: As an action, you can emanate an aura of sunlight. For 1 minute, bright light shines from you in a 30-foot radius, and dim light shines 30 feet beyond that.

      Whenever an enemy creature starts its turn in the bright light, the creature takes 10 radiant damage.

      In addition, for the duration, you have advantage on saving throws against spells cast by fiends or undead.

      Once you use this feature, you can't use it again until you finish a long rest.",
    ],
  },
  extra_spells: {},
  specific_spells: {
    3=> [
      ['Protection from Evil and Good','Normal'],
      ['Sanctuary','Normal'],
    ],
    5=> [
      ['Lesser Restoration','Normal'],
      ['Zone of Truth','Normal'],
    ],
    9=> [
      ['Beacon of Hope','Normal'],
      ['Dispel Magic','Normal'],
    ],
    13=> [
      ['Freedom of Movement','Normal'],
      ['Guardian of Faith','Normal'],
    ],
    17=> [
      ['Commune','Normal'],
      ['Flame Strike','Normal'],
    ],
    'stat'=> 'Charisma',
    'source'=> 'Oath of Devotion',
  },
  custom_mods: {},
)

Paladin.subclasses.create(
  name: "Oath of Vengeance",
  description: "The Oath of Vengeance is a solemn commitment to punish those who have committed a grievous sin. When evil forces slaughter helpless villagers, when an entire people turns against the will of the gods, when a thieves' guild grows too violent and powerful, when a dragon rampages through the countryside – at times like these, paladins arise and swear an Oath of Vengeance to set right that which has gone wrong. To these paladins – sometimes called avengers or dark knights – their own purity is not as important as delivering justice.",
  leveled_choice: {
    3=>[
      "Abjure Enemy: As an action, you present your holy symbol and speak a prayer of denunciation, using your Channel Divinity. Choose one creature within 60 feet of you that you can see. That creature must make a Wisdom saving throw, unless it is immune to being frightened. Fiends and undead have disadvantage on this saving throw.

      On a failed save, the creature is frightened for 1 minute or until it takes any damage. While frightened, the creature's speed is 0, and it can't benefit from any bonus to its speed.

      On a successful save, the creature's speed is halved for 1 minute or until the creature takes any damage.",
      "Vow of Enmity: As a bonus action, you can utter a vow of enmity against a creature you can see within 10 feet of you, using your Channel Divinity. You gain advantage on attack rolls against the creature for 1 minute or until it drops to 0 hit points or falls unconscious.",
    ],
  },
  equipment_choices: {},
  features: {
    7=> [
      "Relentless Avenger: Your supernatural focus helps you close off a foe's retreat. When you hit a creature with an opportunity attack, you can move up to half your speed immediately after the attack and as part of the same reaction. This movement doesn't provoke opportunity attacks.",
    ],
    15=> [
      "Soul of Vengeance: The authority with which you speak your Vow of Enmity gives you greater power over your foe. When a creature under the effect of your Vow of Enmity makes an attack, you can use your reaction to make a melee weapon attack against that creature if it is within range.",
    ],
    20=> [
      "Avenging Angel: You can assume the form of an angelic avenger. Using your action, you undergo a transformation. For 1 hour, you gain the following benefits:

      Wings sprout from your back and grant you a flying speed of 60 feet.
      You emanate an aura of menace in a 30-foot radius. The first time any enemy creature enters the aura or starts its turn there during a battle, the creature must succeed on a Wisdom saving throw or become frightened of you for 1 minute or until it takes any damage. Attack rolls against the frightened creature have advantage.
      Once you use this feature, you can't use it again until you finish a long rest.",
    ],
  },
  extra_spells: {},
  specific_spells: {
    3=> [
      ['Bane','Normal'],
      ["Hunter's Mark",'Normal'],
    ],
    5=> [
      ['Hold Person','Normal'],
      ['Misty Step','Normal'],
    ],
    9=> [
      ['Haste','Normal'],
      ['Protection from Energy','Normal'],
    ],
    13=> [
      ['Banishment','Normal'],
      ['Dimension Door','Normal'],
    ],
    17=> [
      ['Hold Monster','Normal'],
      ['Scrying','Normal'],
    ],
    'stat'=> 'Charisma',
    'source'=> 'Oath of Vengeance',
  },
  custom_mods: {},
)

Ranger = PlayerClass.create(
  name: 'Ranger',
  hit_die: 10,
  starting_hp: 10,
  saving_throws: [0,1],
  armor: ['Light','Medium','Shields'],
  weapons: ['Simple','Martial'],
  tools: [],
  skill_choices: ['Animal Handling','Athletics','Insight','Investigation','Nature','Perception','Stealth','Survival'],
  num_skills: 3,
  equipment_choices: {
    'choices'=>[
      ['Scale Mail#1','Leather Armor#1'],
      ['Shortsword#2','simple#2'],
      ["Dungeoneer's Pack#1","Explorer's Pack#1"],
    ],
    'default'=>['Longbow#1','Quiver#1','Arrows#1'],
  },
  spellcasting_ability: 5,
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [2,0,2,0,0,0,0,0,0,0,0],
    [3,0,3,0,0,0,0,0,0,0,0],
    [3,0,3,0,0,0,0,0,0,0,0],
    [4,0,4,2,0,0,0,0,0,0,0],
    [4,0,4,2,0,0,0,0,0,0,0],
    [5,0,4,3,0,0,0,0,0,0,0],
    [5,0,4,3,0,0,0,0,0,0,0],
    [6,0,4,3,2,0,0,0,0,0,0],
    [6,0,4,3,2,0,0,0,0,0,0],
    [7,0,4,3,3,0,0,0,0,0,0],
    [7,0,4,3,3,0,0,0,0,0,0],
    [8,0,4,3,3,1,0,0,0,0,0],
    [8,0,4,3,3,1,0,0,0,0,0],
    [9,0,4,3,3,2,0,0,0,0,0],
    [9,0,4,3,3,2,0,0,0,0,0],
    [10,0,4,3,3,3,1,0,0,0,0],
    [10,0,4,3,3,3,1,0,0,0,0],
    [11,0,4,3,3,3,2,0,0,0,0],
    [11,0,4,3,3,3,2,0,0,0,0],
  ],
  wealth_die: 5,
  features: {
    1=>[
      "Favored Enemy: You have significant experience studying, tracking, hunting, and even talking to a certain type of enemy.
      Choose a type of favored enemy: aberrations, beasts, celestials, constructs, dragons, elementals, fey, fiends, giants, monstrosities, oozes, plants, or undead. Alternatively, you can select; celestials and fiends, or oozes and plants, or two races of humanoid (such as gnolls and orcs) as favored enemies.
      You have advantage on Wisdom checks involving your favored enemies and on Intelligence checks to recall information about them.
      You also have gain a +2 bonus to damage with weapon attacks, which increases to +3 at 6th level, and +4 at 14th level.
      When you gain this feature, you also learn one language of your choice that is spoken by your favored enemies, if they speak one at all. You choose one additional favored enemy, as well as an associated language, at 6th and 14th level.
      At 10th level you may select to replace the favored enemy you selected at 1st level, though you do not gain a language for this shift.",
      "Natural Explorer: You are adept at traveling and surviving in the wilderness and particularly familiar with one type of natural environment. Choose one type of favored terrain: arctic, coast, desert, forest, grassland, mountain, swamp, or the Underdark. When you make an Intelligence (Investigation, Nature) or Wisdom (Animal Handling, Perception, Survival) check while in your related to your favored terrain, your proficiency bonus is doubled if you are using one of those skill that you're proficient in, or you add half your proficiency bonus (rounded down) if you are not proficient. While traveling for an hour or more in your favored terrain, you gain the following benefits:

      Difficult terrain doesn't slow your group's travel.
      Your group can't become lost except by magical means.
      Even when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger.
      If you are traveling alone, you can move stealthily at a normal pace.
      When you forage, you find twice as much food as you normally would.
      While tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area.
      You may choose an additional favoured terrain At 5th, 10th & 15th level."
    ],
    2=>[
      "Fighting Styles: You adopt a particular fighting style as your specialty. If you choose another fighting style later on, you can't take a Fighting Style more than once.",
      "Spellcasting: You have learned to use the magical essence of nature to cast spells."
    ],
    3=>[
      "Ranger Archetype: Choose an archetype that you strive to emulate. Your choice grants you features at 3rd, 7th, 11th and 15th level.",
      "Primeval Awareness: You can use your action and expend one ranger spell slot to focus your awareness on the region around you.
      For one minute per level of the spell slot you expend, you can sense whether the following types of creatures are present within 1 mile of you (or within up to 6 miles if you are in your favored terrain): aberrations, celestials, dragons, elementals, fey, fiends, and undead. This feature doesn't reveal the creatures' location or number."
    ],
    4=>[
      "Ability Score Increase:"
    ],
    5=>[
      "Extra Attack: You can attack twice whenever you take the Attack action on your turn."
    ],
    8=>[
      "Ability Score Increase:",
      "Land's Stride: Moving through nonmagical difficult terrain coss you no extra movement. You can also pass through nonmagical plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard.
      In addition, you have advantage on saving throws against plants that are magically created or manipulated to impede movement."
    ],
    10=>[
      "Hide in Plain Sight: You can spend 1 minute creating camouflage for yourself. You must have access to fresh mud, dirt, plants, soot, and other naturally occurring materials with which to create your camouflage.
      Once you are camouflaged in this way, you can try to hide by pressing yourself up against a solid surface, such as a tree or wall, that is at least as tall and wide as you are. You gain a +10 bonus to Dexterity(Stealth) checks as long as you remain there without moving or taking actions. Once you move or take an action or a reaction, you must camouflage yourself again to gain this benefit."
    ],
    12=>[
      "Ability Score Increase:"
    ],
    14=>[
      "Vanish: You can use the Hide action as a bonus action on your turn. Also, you can't be tracked by nonmagical means, unless you choose to leave a trail."
    ],
    16=>[
      "Ability Score Increase:"
    ],
    18=>[
      "Feral Sense: You gain preternatural senses that help you fight creatures you can't see. When you attack a creature you can't see, your inability to see it doesn't impose disadvantage on your attack rolls against it.
      You are also aware of the location of any invisible creature within 30 feet of you, provided that the creature isn't hidden from you and you aren't blinded or deafened."
    ],
    19=>[
      "Ability Score Increase:"
    ],
    20=>[
      "Foe Slayer: You become an unparalleled hunter of your enemies. Once on each of your turns, you can add your Wisdom modifier to the attack roll or the damage roll of an attack you make against one of your favored enemies. You can choose to use this feature before or after the roll, but before any effects of the roll are applied."
    ],
  },
  leveled_choice: {
    2=>[
      "Archery: You gain a +2 bonus to attack rolls you make with ranged weapons.",
      "Defense: While you are wearing armor, you gain a +1 bonus to AC.",
      "Dueling: When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.",
      "Two-Weapon Fighting: When you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack.",
    ]
  },
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Ranger.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Ranger.subclasses.create(
  name: "Hunter",
  description: "Emulating the Hunter archetype means accepting your place as a bulwark between civilization and the terrors of the wilderness. As you walk the Hunter's path, you learn specialized techniques for fighting the threats you face, from rampaging ogres and hordes of orcs to towering giants and terrifying dragons.",
  leveled_choice: {
    3=>[
      "Colossus Slayer: Your tenacity can wear down the most potent foes. When you hit a creaure wih a weapon attack, the creature akes an exra 1d8 damage if it's below its hit point maximum. You can deal this extra damage only oce per turn.",
      "Giant Killer: When a Large or larger creature within 5 feet of you hits or misses you with an attck, you can use your reaction to attack that creature immediately after its attack, provided that you can see the creature.",
      "Horde Breaker: Once on each of your turns when you make a weapon attack, you can make another attack with the same weapon against a different creature that is within 5 feet of the original target and within range of your weapon."
    ],
    7=>[
      "Escape the Horde: Opportunity attacks against you are made with disadvantage.",
      "Multiattack Defense: When a creature hits you with an attack, you gain a +4 bonus to AC against all subsequent attacks made by that creature for the rest of the turn.",
      "Steel Will: You have the advantage on saving throws against being frightened.",
    ],
    11=>[
      "Volley: You can use your action to make a ranged attack against any number of creatures within 10 feet of a point you can see within your weapon's range. You must have ammunition for each target, as normal, and you make a separate attack roll for each target.",
      "Whirlwind Attack: You can use your action to make a melee attack against any numnber of creatures within 5 feet of you, with a separate attack roll for each target.",
    ],
    15=>[
      "Evasion: When you are subjected to an effect, such as a red dragon's fiery breath or a lightning bolt spell, that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed on the saving throw, and only half damage if you fail.",
      "Stand Against the Tide: When a hostile creature misses you with a melee attack, you can use your reaction to force that creature to repeat the same attack against another creature (other than itself) of your choice.",
      "Uncanny Dodge: When an attacker that you can see hits you with an attackm you can use your reaction to halve the attack's damage against you.",
    ]
  },
  equipment_choices: {},
  features: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Ranger.subclasses.create(
  name: "Beast Master",
  description: "The Beast Master embodies a friendship between the civilized races and the beasts of the wild. United in focus, beast and ranger fight the monsters that threaten civilization and the wilderness alike.",
  features: {
    3=>["You gain a beast companion that accompanies you on your adventures and is trained to fight alongside you. Choose a beast that is no larger than Medium and that has a challenge rating of 1/4 or lower (appendix D presents statistics for the hawk, mastiff, and panther as examples). Add your proficiency bonus to the beast’s AC, attack rolls, and damage rolls, as well as to any saving throws and skills it is proficient in. Its hit point maximum equals its normal maximum or four times your ranger level, whichever is higher. Like any creature, the beast can spend Hit Dice during a short rest.
    The beast obeys your commands as best as it can. It takes its turn on your initiative. On your turn, you can verbally command the beast where to move (no action required by you). You can use your action to verbally command it to take the Attack, Dash, Disengage, or Help action. If you don’t issue a command, the beast takes the Dodge action. Once you have the Extra Attack feature, you can make one weapon attack yourself when you command the beast to take the Attack action. While traveling through your favored terrain with only the beast, you can move stealthily at a normal pace.
    If you are incapacitated or absent, the beast acts on its own, focusing on protecting you and itself. The beast never requires your command to use its reaction, such as when making an opportunity attack.
    If the beast dies, you can obtain another one by spending 8 hours magically bonding with another beast that isn’t hostile to you, either the same type of beast as before or a different one."],
    7=>["On any of your turns when your beast companion doesn't attack, you can use a bonus action to command the beast to take the Dash, Disengage, DOdge, or Help action on its turn."],
    11=>["When you command your beast companion to take the Attack action, the beast can make two attcks, or it can take the Multiattack action if it has that action."],
    15=>["When you cast a spell targeting yourself, you can also affect your beast companion with the spell if the beast is within 30 feet of you."],
    },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Rogue = PlayerClass.create(
  name: 'Rogue',
  hit_die: 8,
  starting_hp: 8,
  saving_throws: [1,3],
  armor: ['Light'],
  weapons: ['Simple','Hand Crossbow','Longsword','Rapier','Shortsword'],
  tools: ["Thief's Tools"],
  skill_choices: ['Acrobatics','Athletics','Deception','Insight','Intimidation','Investigation','Perception','Performance','Persuasion','Sleight of Hand','Stealth'],
  num_skills: 4,
  equipment_choices: {
    'choices'=> [
      ['Rapier#1','Shortsword#1'],
      [['Shortbow#1','Arrows#1'],'Shortsword#1'],
      [['Light Crossbow#1','Bolts#1'],'Handaxe#2'],
      ["Burglar's Pack", 'Dungeoneer\'s Pack#1','Explorer\'s Pack#1'],
    ],
    'default'=> [
      "Leather Armor#1",
      "Dagger#2",
      "Thief's Tools",
    ],
  },
  wealth_die: 5,
  features: {
    1=> [
      "Expertise: Choose two of your skill proficiencies, or one of your skill proficiencies and your proficiency with thieves' tools. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies.

      At 6th level, you can choose two more of your proficiencies (in skills or with thieves' tools) to gain this benefit.",
      "Thieve's Cant: During your rogue training you learned thieves' cant, a secret mix of dialect, jargon, and code that allows you to hide messages in seemingly normal conversation. Only another creature that knows thieves' cant understands such messages. It takes four times longer to convey such a message than it does to speak the same idea plainly.

      In addition, you understand a set of secret signs and symbols used to convey short, simple messages, such as whether an area is dangerous or the territory of a thieves' guild, whether loot is nearby, or whether the people in an area are easy marks or will provide a safe house for thieves on the run.",
    ],
    2=> [
      "Cunning Action: Your quick thinking and agility allow you to move and act quickly. You can take a bonus action on each of your turns in combat. This action can be used only to take the Dash, Disengage, or Hide action.",
    ],
    3=>[
      "Roguish Archetype: You choose an archetype that you emulate in the exercise of your rogue abilities. Your archetype choice grants you features at 3rd level and then again at 9th, 13th, and 17th level.",
    ],
    4=>[
      "Ability Score Increase:",
    ],
    5=>[
      "Uncanny Dodge: When an attacker that you can see hits you with an attack, you can use your reaction to halve the attack's damage against you.",
    ],
    6=>[
      "Ability Score Increase:",
    ],
    7=>[
      "Evasion: You can nimbly dodge out of the way of certain area effects, such as a red dragon's fiery breath or an Ice Storm spell. When you are subjected to an effect that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed on the saving throw, and only half damage if you fail.",
    ],
    8=>[
      "Ability Score Increase:",
    ],
    11=>[
      "Reliable Talent: You have refined your chosen skills until they approach perfection. Whenever you make an ability check that lets you add your proficiency bonus, you can treat a d20 roll of 9 or lower as a 10.",
    ],
    12=>[
      "Ability Score Increase:",
    ],
    14=>[
      "Ability Score Increase:",
      "Blindsense: You are so evasive that attackers rarely gain the upper hand against you. No attack roll has advantage against you while you aren't incapacitated.",
    ],
    16=>[
      "Ability Score Increase:",
    ],
    19=>[
      "Ability Score Increase:",
    ],
    20=>[
      "Stroke of Luck: You have an uncanny knack for succeeding when you need to. If your attack misses a target within range, you can turn the miss into a hit. Alternatively, if you fail an ability check, you can treat the d20 roll as a 20.

      Once you use this feature, you can't use it again until you finish a short or long rest.",
    ],
  },
  leveled_choice: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
  spellcasting_ability: 0,
  spell_table: [
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
  ],
)

Rogue.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Rogue.subclasses.create(
  name: "Arcane Trickster",
  description: "Some rogues enhance their fine-honed skills of stealth and agility with magic, learning tricks of enchantment and illusion. These rogues include pickpockets and burglars, but also pranksters, mischief-makers, and a significant number of adventurers.",
  features: {
    3=>["Mage Hand Legerdemain: When you cast Mage Hand, you can make the spectral hand invisible, and you can perform the following additional tasks with it:

      You can stow one object the hand is holding in a container worn or carried by another creature.
      You can retrieve an object in a container worn or carried by another creature.
      You can use thieves' tools to pick locks and disarm traps at range.
      You can perform one of these tasks without being noticed by a creature if you succeed on a Dexterity (Sleight of Hand) check contested by the creature's Wisdom (Perception) check.

      In addition, you can use the bonus action granted by your Cunning Action to control the hand."],
    9=>["Magical Ambush: If you are hidden from a creature when you cast a spell on it, the creature has disadvantage on any saving throw it makes against the spell this turn."],
    13=>["Versatile Trickster: You gain the ability to distract targets with your Mage Hand. As a bonus action on your turn, you can designate a creature within 5 feet of the spectral hand created by the spell. Doing so gives you advantage on attack rolls against that creature until the end of the turn."],
    17=>["Spell Thief: You gain the ability to magically steal the knowledge of how to cast a spell from another spellcaster.

      Immediately after a creature casts a spell that targets you or includes you in its area of effect, you can use your reaction to force the creature to make a saving throw with its spellcasting ability modifier. The DC equals your spell save DC. On a failed save, you negate the spell's effect against you, and you steal the knowledge of the spell if it is at least 1st level and of a level you can cast (it doesn't need to be a wizard spell). For the next 8 hours, you know the spell and can cast it using your spell slots. The creature can't cast that spell until the 8 hours have passed.

      Once you use this feature, you can't use it again until you finish a long rest."],
    },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {
    3=> [["Mage Hand", 'Cantrip']],
    'stat'=> 'Intelligence',
    'source'=> 'Arcane Trickster',
  },
  custom_mods: {
    'spell_table'=> [
      [0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0],
      [3,2,2,0,0,0,0,0,0,0,0],
      [4,2,3,0,0,0,0,0,0,0,0],
      [4,2,3,0,0,0,0,0,0,0,0],
      [4,2,3,0,0,0,0,0,0,0,0],
      [5,2,4,2,0,0,0,0,0,0,0],
      [6,2,4,2,0,0,0,0,0,0,0],
      [6,2,4,2,0,0,0,0,0,0,0],
      [7,3,4,3,0,0,0,0,0,0,0],
      [8,3,4,3,0,0,0,0,0,0,0],
      [8,3,4,3,0,0,0,0,0,0,0],
      [9,3,4,3,2,0,0,0,0,0,0],
      [10,3,4,3,2,0,0,0,0,0,0],
      [10,3,4,3,2,0,0,0,0,0,0],
      [11,3,4,3,3,0,0,0,0,0,0],
      [11,3,4,3,3,0,0,0,0,0,0],
      [11,3,4,3,3,0,0,0,0,0,0],
      [12,3,4,3,3,1,0,0,0,0,0],
      [13,3,4,3,3,1,0,0,0,0,0],
    ],
    'spell_stat'=> 4, #we dont count from zero on these because 0 is 'None
    'spell_list'=> 'Wizard',
  },
)

Rogue.subclasses.create(
  name: "Assassin",
  description: "You focus your training on the grim art of death. Those who adhere to this archetype are diverse: hired killers, spies, bounty hunters, and even specially anointed priests trained to exterminate the enemies of their deity. Stealth, poison, and disguise help you eliminate your foes with deadly efficiency.",
  features: {
    3=>["Assassinate: You are at your deadliest when you get the drop on your enemies. You have advantage on attack rolls against any creature that hasn't taken a turn in the combat yet. In addition, any hit you score against a creature that is surprised is a critical hit."],
    9=>["Infiltration Expertise: You can unfailingly create false identities for yourself. You must spend seven days and 25 gp to establish the history, profession, and affiliations for an identity. You can't establish an identity that belongs to someone else. For example, you might acquire appropriate clothing, letters of introduction, and official- looking certification to establish yourself as a member of a trading house from a remote city so you can insinuate yourself into the company of other wealthy merchants.

      Thereafter, if you adopt the new identity as a disguise, other creatures believe you to be that person until given an obvious reason not to."],
    13=>["Imposter: You gain the ability to unerringly mimic another person's speech, writing, and behavior. You must spend at least three hours studying these three components of the person's behavior, listening to speech, examining handwriting, and observing mannerisms.

      Your ruse is indiscernible to the casual observer. If a wary creature suspects something is amiss, you have advantage on any Charisma (Deception) check you make to avoid detection."],
    17=>["Death Strike: You become a master of instant death. When you attack and hit a creature that is surprised, it must make a Constitution saving throw (DC 8 + your Dexterity modifier + your proficiency bonus). On a failed save, double the damage of your attack against the creature."],
    },
  tools: ["Disguise Kit","Poisoner's Kit"],
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Rogue.subclasses.create(
  name: "Thief",
  description: "You hone your skills in the larcenous arts. Burglars, bandits, cutpurses, and other criminals typically follow this archetype, but so do rogues who prefer to think of themselves as professional treasure seekers, explorers, delvers, and investigators. In addition to improving your agility and stealth, you learn skills useful for delving into ancient ruins, reading unfamiliar languages, and using magic items you normally couldn't employ.",
  features: {
    3=>[
      "Fast Hands: You can use the bonus action granted by your Cunning Action to make a Dexterity (Sleight of Hand) check, use your thieves' tools to disarm a trap or open a lock, or take the Use an Object action.",
      "Second-Story Work: You gain the ability to climb faster than normal; climbing no longer costs you extra movement.

      In addition, when you make a running jump, the distance you cover increases by a number of feet equal to your Dexterity modifier.",
    ],
    9=>["Supreme Sneak: You have advantage on a Dexterity (Stealth) check if you move no more than half your speed on the same turn."],
    13=>["Use Magic Device: You have learned enough about the workings of magic that you can improvise the use of items even when they are not intended for you. You ignore all class, race, and level requirements on the use of magic items."],
    17=>["Thief's Reflexes: You have become adept at laying ambushes and quickly escaping danger. You can take two turns during the first round of any combat. You take your first turn at your normal initiative and your second turn at your initiative minus 10. You can't use this feature when you are surprised."],
    },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Sorceror = PlayerClass.create(
  name: 'Sorceror',
  hit_die: 6,
  starting_hp: 6,
  saving_throws: [2,5],
  armor: [],
  weapons: ['Dagger','Darts','Sling','Quarterstaff','Light Crossbow'],
  tools: [],
  skill_choices: ['Arcana','Deception','Insight','Intimidation','Persuasion','Religion'],
  num_skills: 2,
  equipment_choices: {
    'choices'=>[
      [['Light Crossbow#1','Bolts#1'],'simple#1'],
      ['Component Pouch#1','Arcane Crystal#1'],
      ["Dungeoneer's Pack#1","Explorer's Pack#1"],
    ],
    'default'=>['Dagger#2'],
  },
  spellcasting_ability: 6,
  spell_table: [
    [2,4,2,0,0,0,0,0,0,0,0],
    [3,4,3,0,0,0,0,0,0,0,0],
    [4,4,4,2,0,0,0,0,0,0,0],
    [5,5,4,3,0,0,0,0,0,0,0],
    [6,5,4,3,2,0,0,0,0,0,0],
    [7,5,4,3,3,0,0,0,0,0,0],
    [8,5,4,3,3,1,0,0,0,0,0],
    [9,5,4,3,3,2,0,0,0,0,0],
    [10,5,4,3,3,3,1,0,0,0,0],
    [11,6,4,3,3,3,2,0,0,0,0],
    [12,6,4,3,3,3,2,1,0,0,0],
    [12,6,4,3,3,3,2,1,0,0,0],
    [13,6,4,3,3,3,2,1,1,0,0],
    [13,6,4,3,3,3,2,1,1,0,0],
    [14,6,4,3,3,3,2,1,1,1,0],
    [14,6,4,3,3,3,2,1,1,1,0],
    [15,6,4,3,3,3,2,1,1,1,1],
    [15,6,4,3,3,3,3,1,1,1,1],
    [15,6,4,3,3,3,3,2,1,1,1],
    [15,6,4,3,3,3,3,2,2,1,1],
  ],
  wealth_die: 5,
  features: {
    1=>[
      "Spellcasting: An event in your past, or in the life of a parent or ancestor, left an indelible mark on you, infusing you with arcane magic. This font of magic, whatever its origin, fuels your spells. Additionally, when you gain a level in this class, you can choose one of the sorcerer spells you know and replace it with another spell from the sorcerer spell list, which also must be of a level for which you have spell slots.",
      "Sorcerous Origin: Choose a sorcerous origin, which describes the source of your innate magical power. Your choice grants you features when you choose it at 1st level and again at 6th, 14th, and 18th level.",
    ],
    2=>[
      "Font of Magic: you tap into a deep wellspring of magic within yourself. This wellspring is represented by sorcery points, which allow you to create a variety of magical effects.

      Sorcery Points. You have 2 sorcery points, and you gain more as you reach higher levels, as shown in the Sorcery Points column of the Sorcerer table. You can never have more sorcery points than shown on the table for your level. You regain all spent sorcery points when you finish a long rest.
      Flexible Casting. You can use your sorcery points to gain additional spell slots, or sacrifice spell slots to gain additional sorcery points. You learn other ways to use your sorcery points as you reach higher levels.
      Creating Spell Slots. You can transform unexpended sorcery points into one spell slot as a bonus action on your turn. The Creating Spell Slots table shows the cost of creating a spell slot of a given level. You can create spell slots no higher in level than 5th. Any spell slot you create with this feature vanishes when you finish a long rest.
      Converting a Spell Slot to Sorcery Points. As a bonus action on your turn, you can expend one spell slot and gain a number of sorcery points equal to the slot's level.",
    ],
    3=>[
      "Metamagic: you gain the ability to twist your spells to suit your needs. You gain two of the following Metamagic options of your choice. You gain another one at 10th and 17th level.

      You can use only one Metamagic option on a spell when you cast it, unless otherwise noted."
    ],
    4=>[
      "Ability Score Increase:"
    ],
    8=>[
      "Ability Score Increase:"
    ],
    12=>[
      "Ability Score Increase:"
    ],
    16=>[
      "Ability Score Increase:"
    ],
    19=>[
      "Ability Score Increase:"
    ],
    20=>[
      "Sorcerous Restoration: You regain 4 expended sorcery points whenever you finish a short rest.",
    ]
  },
  leveled_choice: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Sorceror.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Sorceror.subclasses.create(
  name: "Draconic Bloodline",
  description: "Your innate magic comes from draconic magic that was mingled with your blood or that of your ancestors. Most often, sorcerers with this origin trace their descent back to a mighty sorcerer of ancient times who made a bargain with a dragon or who might even have claimed a dragon parent. Some of these bloodlines are well established in the world, but most are obscure. Any given sorcerer could be the first of a new bloodline, as a result of a pact or some other exceptional circumstance.",
  features: {
    1=>[
      "Draconic Charm: Whenever you make a Charisma check when interacting with dragons, your proficiency bonus is doubled if it applies to the check.",
      "Draconic Resilience: As magic flows through your body, it causes physical traits of your dragon ancestors to emerge. At 1st level, your hit point maximum increases by 1 and increases by 1 again whenever you gain a level in this class.

      Additionally, parts of your skin are covered by a thin sheen of dragon-like scales. When you aren't wearing armor, your AC equals 13 + your Dexterity modifier.",
    ],
    6=>[
      "Elemental Affinity: When you cast a spell that deals damage of the type associated with your draconic ancestry, add your Charisma modifier to one damage roll of that spell. At the same time, you can spend 1 sorcery point to gain resistance to that damage type for 1 hour.",
    ],
    14=>[
      "Dragon Wings: You gain the ability to sprout a pair of dragon wings from your back, gaining a flying speed equal to your current speed. You can create these wings as a bonus action on your turn. They last until you dismiss them as a bonus action on your turn.

      You can't manifest your wings while wearing armor unless the armor is made to accommodate them, and clothing not made to accommodate your wings might be destroyed when you manifest them.",
    ],
    18=>[
      "Draconic Presence: You can channel the dread presence of your dragon ancestor, causing those around you to become awestruck or frightened. As an action, you can spend 5 sorcery points to draw on this power and exude an aura of awe or fear (your choice) to a distance of 60 feet. For 1 minute or until you lose your concentration (as if you were casting a concentration spell), each hostile creature that starts its turn in this aura must succeed on a Wisdom saving throw or be charmed (if you chose awe) or frightened (if you chose fear) until the aura ends. A creature that succeeds on this saving throw is immune to your aura for 24 hours.",
    ],
  },
  leveled_choice: {
    1=> [
      "Black: Acid Damage",
      "Blue: Lightning Damage",
      "Brass: Fire Damage",
      "Bronze: Lightning Damage",
      "Copper: Acid Damage",
      "Gold: Fire Damage",
      "Green: Poison Damage",
      "Red: Fire Damage",
      "Silver: Cold Damage",
      "White: Cold Damage",
    ],
  },
  languages: ["Draconic"],
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Sorceror.subclasses.create(
  name: "Wild Magic",
  description: "Your innate magic comes from the wild forces of chaos that underlie the order of creation. You might have endured exposure to some form of raw magic, perhaps through a planar portal leading to Limbo, the Elemental Planes, or the mysterious Far Realm. Perhaps you were blessed by a powerful fey creature or marked by a demon. Or your magic could be a fluke of your birth, with no apparent cause or reason. However it came to be, this chaotic magic churns within you, waiting for any outlet.",
  features: {
    1=>[
      "Wild Magic Surge: Your spellcasting can unleash surges of untamed magic. Once per turn, the DM can have you roll a d20 immediately after you cast a sorcerer spell of 1st level or higher. If you roll a 1, roll on the Wild Magic Surge table to create a magical effect. If that effect is a spell, it is too wild to be affected by your Metamagic, and if it normally requires concentration, it doesn't require concentration in this case; the spell lasts for its full duration.",
      "Tides of Chaos: You can manipulate the forces of chance and chaos to gain advantage on one attack roll, ability check, or saving throw. Once you do so, you must finish a long rest before you can use this feature again.

      Any time before you regain the use of this feature, the DM can have you roll on the Wild Magic Surge table immediately after you cast a sorcerer spell of 1st level or higher. You then regain the use of this feature.",
    ],
    6=>[
      "Bend Luck: You have the ability to twist fate using your wild magic. When another creature you can see makes an attack roll, an ability check, or a saving throw, you can use your reaction and spend 2 sorcery points to roll 1d4 and apply the number rolled as a bonus or penalty (your choice) to the creature's roll. You can do so after the creature rolls but before any effects of the roll occur.",
    ],
    14=>[
      "Controlled Chaos: You gain a modicum of control over the surges of your wild magic. Whenever you roll on the Wild Magic Surge table, you can roll twice and use either number.",
    ],
    18=>[
      "Spell Bombardment: The harmful energy of your spells intensifies. When you roll damage for a spell and roll the highest number possible on any of the dice, choose one of those dice, roll it again and add that roll to the damage. You can use the feature only once per turn.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Warlock = PlayerClass.create(
  name: 'Warlock',
  hit_die: 8,
  starting_hp: 8,
  saving_throws: [4,5],
  armor: ['Light'],
  weapons: ['Simple'],
  tools: [],
  skill_choices: ['Arcana','Deception','History','Intimidation','Investigation','Nature','Religion'],
  num_skills: 2,
  equipment_choices: {
    'choices'=>[
      [['Light Crossbow#1','Bolts#1'],'simple#1'],
      ['Component Pouch#1','Arcane Crystal#1'],
      ["Dungeoneer's Pack#1","Scholar's Pack#1"],
    ],
    'default'=>['Leather Armor#1','simple#1','Dagger#2'],
  },
  spellcasting_ability: 6,
  spell_table: [
    [2,2,1,0,0,0,0,0,0,0,0],
    [3,2,2,0,0,0,0,0,0,0,0],
    [4,2,0,2,0,0,0,0,0,0,0],
    [5,3,0,2,0,0,0,0,0,0,0],
    [6,3,0,0,2,0,0,0,0,0,0],
    [7,3,0,0,2,0,0,0,0,0,0],
    [8,3,0,0,0,2,0,0,0,0,0],
    [9,3,0,0,0,2,0,0,0,0,0],
    [10,3,0,0,0,0,2,0,0,0,0],
    [10,4,0,0,0,0,2,0,0,0,0],
    [11,4,0,0,0,0,3,0,0,0,0],
    [11,4,0,0,0,0,3,0,0,0,0],
    [12,4,0,0,0,0,3,0,0,0,0],
    [12,4,0,0,0,0,3,0,0,0,0],
    [13,4,0,0,0,0,3,0,0,0,0],
    [13,4,0,0,0,0,3,0,0,0,0],
    [14,4,0,0,0,0,4,0,0,0,0],
    [14,4,0,0,0,0,4,0,0,0,0],
    [15,4,0,0,0,0,4,0,0,0,0],
    [15,4,0,0,0,0,4,0,0,0,0],
  ],
  wealth_die: 4,
  features: {
    1=>[
      "Otherwordly Patron: You have struck a bargain with an otherworldly being of your choice. Your arcane research and the magic bestowed on you by your patron have given you facility with spells.",
    ],
    2=>[
      "Eldritch Invocations: In your study of occult lore, you have unearthed Eldritch Invocations, fragments of forbidden knowledge that imbue you with an abiding magical ability.

      At 2nd level, you gain two eldritch invocations of your choice. When you gain certain warlock levels, you gain additional invocations of your choice, as shown in the Invocations Known column of the Warlock table. A level prerequisite refers to your level in this class.

      Additionally, when you gain a level in this class, you can choose one of the invocations you know and replace it with another invocation that you could learn at that level.",
    ],
    3=>[
      "Pact Boon: Your otherworldly patron bestows a gift upon you for your loyal service. You gain one feature of your choice.",
    ],
    4=>[
      "Ability Score Increase:"
    ],
    8=>[
      "Ability Score Increase:"
    ],
    11=>[
      "Mystic Arcanum: Your patron bestows upon you a magical secret called an arcanum. Choose one 6th-level spell from the warlock spell list as this arcanum.

      You can cast your arcanum spell once without expending a spell slot. You must finish a long rest before you can do so again.

      At higher levels, you gain more warlock spells of your choice that can be cast in this way: one 7th-level spell at 13th level, one 8th-level spell at 15th level, and one 9th-level spell at 17th level. You regain all uses of your Mystic Arcanum when you finish a long rest.",
    ],
    12=>[
      "Ability Score Increase:"
    ],
    16=>[
      "Ability Score Increase:"
    ],
    19=>[
      "Ability Score Increase:"
    ],
    20=>[
      "Eldritch Master: You can draw on your inner reserve of mystical power while entreating your patron to regain expended spell slots. You can spend 1 minute entreating your patron for aid to regain all your expended spell slots from your Pact Magic feature. Once you regain spell slots with this feature, you must finish a long rest before you can do so again.",
    ]
  },
  leveled_choice: {
    3=>[
      "Pact of the Chain: You learn the find familiar spell and can cast it as a ritual. The spell doesn’t count against your number of spells known.

      When you cast the spell, you can choose one of the normal forms for your familiar or one of the following special forms: imp, pseudodragon, quasit, or sprite.

      Additionally, when you take the Attack action, you can forgo one of your own attacks to allow your familiar to make one attack of its own with its reaction.",
      "Pact of the Blade: You can use your action to create a pact weapon in your empty hand. You can choose the form that this melee weapon takes each time you create it. You are proficient with it while you wield it. This weapon counts as magical for the purpose of overcoming resistance and immunity to nonmagical attacks and damage.

      Your pact weapon disappears if it is more than 5 feet away from you for 1 minute or more. It also disappears if you use this feature again, if you dismiss the weapon (no action required), or if you die.

      You can transform one Magic Weapon into your pact weapon by performing a special ritual while you hold the weapon. You perform the ritual over the course of 1 hour, which can be done during a short rest. You can then dismiss the weapon, shunting it into an extradimensional space, and it appears whenever you create your pact weapon thereafter. You can’t affect an artifact or a sentient weapon in this way. The weapon ceases being your pact weapon if you die, if you perform the 1-hour ritual on a different weapon, or if you use a 1-hour ritual to break your bond to it. The weapon appears at your feet if it is in the extradimensional space when the bond breaks.",
      "Pact of the Tome: Your patron gives you a grimoire called a Book of Shadows. When you gain this feature, choose three cantrips from any class’s spell list (the three needn’t be from the same list). While the book is on your person, you can cast those cantrips at will. They don’t count against your number of cantrips known. If they don’t appear on the warlock spell list, they are nonetheless warlock spells for you.

      If you lose your Book of Shadows, you can perform a 1-hour ceremony to receive a replacement from your patron. This ceremony can be performed during a short or long rest, and it destroys the previous book. The book turns to ash when you die.",
    ],
  },
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'mystic_arcanum'=> {
      'spell_list'=> 'Warlock',
      'source'=> 'Mystic Arcanum',
      'choices'=> [
        #[level, number, spell_level]
        #these are cumulative
        [11, 1, 6],
        [13, 1, 7],
        [15, 1, 8],
      ],
    },
    'level_gated_collection'=> {
      'title'=> "Eldritch Invocations",
      'levels'=> [
        [2,2],
        [5,3],
        [7,4],
        [9,5],
        [12,6],
        [15,7],
        [18,8],
      ],
      'defaults'=> [],
      'options'=> {
        #'name'=> [int(level requirement), str(description), [str(spell name to add to list, optional)])]
        "Agonizing Blast"=> [2, "When you cast eldritch blast, add your Charisma modifier to the damage it deals on a hit.",[],],
        "Armor of Shadows"=> [2,"You can cast mage armor on yourself at will, without expending a spell slot or material components.",["Mage Armor"],],
        "Ascendant Step"=> [9,"You can cast levitate on yourself at will, without expending a spell slot or material components.",["Levitate"],],
        "Aspect of the Moon"=> [
          2,
          "Prerequisite: Pact of the Tome feature.

          You no longer need to sleep and can't be forced to sleep by any means. To gain the benefits of a long rest, you can spend all 8 hours doing light activity, such as reading your Book of Shadows and keeping watch.",
          [],
        ],
        "Beast Soeech"=> [2,"You can cast speak with animals at will, without expending a spell slot.",["Speak with Animals"]],
        "Beguiling Influence"=> [2,"You gain proficiency in the Deception and Persuasion skills.",[]],
        "Bewitching Whispers"=> [7,"You can cast compulsion once using a warlock spell slot. You can't do so again until you finish a long rest.",["Compulsion"]],
        "Book of Ancient Secrets"=> [
          2,
          "Prerequisite: Pact of the Tome feature

          You can now inscribe magical rituals in your Book of Shadows. Choose two 1st-level spells that have the ritual tag from any class's spell list (the two needn't be from the same list). The spells appear in the book and don't count against the number of spells you know. With your Book of Shadows in hand, you can cast the chosen spells as rituals. You can't cast the spells except as rituals, unless you've learned them by some other means. You can also cast a warlock spell you know as a ritual if it has the ritual tag.

          On your adventures, you can add other ritual spells to your Book of Shadows. When you find such a spell, you can add it to the book if the spell's level is equal to or less than half your warlock level (rounded up) and if you can spare the time to transcribe the spell. For each level of the spell, the transcription process takes 2 hours and costs 50 gp for the rare inks needed to inscribe it.",
          [],
        ],
        "Chains of Carceri"=> [
          15,
          "Prerequisite: Pact of the Chain feature

          You can cast hold monster at will – targeting a celestial, fiend, or elemental – without expending a spell slot or material components. You must finish a long rest before you can use this invocation on the same creature again.",
          ["Hold Monster"],
        ],
        "Cloak of Flies"=> [
          5,
          "As a bonus action, you can surround yourself with a magical aura that looks like buzzing flies. The aura extends 5 feet from you in every direction, but not through total cover. It lasts until you're incapacitated or you dismiss it as a bonus action.

          The aura grants you advantage on Charisma (Intimidation) checks but disadvantage on all other Charisma checks. Any other creature that starts its turn in the aura takes poison damage equal to your Charisma modifier (minimum of 0 damage).

          Once you use this invocation, you can't use it again until you finish a short or long rest.",
          [],
        ],
        "Devil's Sight"=> [2,"You can see normally in darkness, both magical and nonmagical, to a distance of 120 feet.",[],],
        "Dreadful Word"=> [7,"You can cast confusion once using a warlock spell slot. You can't do so again until you finish a long rest.",["Confusion"],],
        "Eldritch Mind"=> [2,"You have advantage on Constitution saving throws that you make to maintain your concentration on a spell.",[],],
        "Eldritch Sight"=> [2,"You can cast detect magic at will, without expending a spell slot or material components.",["Detect Magic"],],
        "Eldritch Smite"=> [
          5,
          "Prerequisite: Pact of the Blade feature

          Once per turn when you hit a creature with your pact weapon, you can expend a warlock spell slot to deal an extra 1d8 force damage to the target, plus another 1d8 per level of the spell slot, and you can knock the target prone if it is Huge or smaller.",
          [],
        ],
        "Eldritch Spear"=> [2,"When you cast eldritch blast, its range is 300 feet.",[],],
        "Eyes of the Rune Keeper"=> [2,"You can read all writing.",[],],
        "Fiendish Vigor"=> [2,"You can cast false life on yourself at will as a 1st-level spell, without expending a spell slot or material components.",["False Life"],],
        "Gaze of Two Minds"=> [2,"You can use your action to touch a willing humanoid and perceive through its senses until the end of your next turn. As long as the creature is on the same plane of existence as you, you can use your action on subsequent turns to maintain this connection, extending the duration until the end of your next turn. While perceiving through the other creature's senses, you benefit from any special senses possessed by that creature, and you are blinded and deafened to your own surroundings.",[],],
        "Lifedrinker"=> [
          12,
          "Prerequisite: Pact of the Blade feature

          When you hit a creature with your pact weapon, the creature takes extra necrotic damage equal to your Charisma modifier (minimum 1).",
          [],
        ],
        "Mask of Many Faces"=> [2,"You can cast disguise self at will, without expending a spell slot.",[],],
        "Master of Myriad Forms"=> [15,"You can cast alter self at will, without expending a spell slot.",["Alter Self"],],
        "Minions of Chaos"=> [9,"You can cast conjure elemental once using a warlock spell slot. You can't do so again until you finish a long rest.",["Conjure Elemental"],],
        "Mire the Mind"=> [5,"You can cast slow once using a warlock spell slot. You can't do so again until you finish a long rest.",["Slow"],],
        "Misty Visions"=> [2,"You can cast silent image at will, without expending a spell slot or material components.",["Silent Image"],],
        "One with Shadows"=> [5,"When you are in an area of dim light or darkness, you can use your action to become invisible until you move or take an action or a reaction.",[],],
        "Otherworldly Leap"=> [9,"You can cast jump at will, without expending a spell slot.",["Jump"],],
        "Repelling Blast"=> [2,"When you hit a creature with eldritch blast, you can push the creature up to 10 feet away from you in a straight line.",[],],
        "Sculptor of Flesh"=> [7,"You can cast polymorph once using a warlock spell slot. You can't do so again until you finish a long rest.",["Polymorph"],],
        "Sign of Ill Omen"=> [5,"You can cast bestow curse once using a warlock spell slot. You can't do so again until you finish a long rest.",["Bestow Curse"],],
        "Thief of Five Fates"=> [2,"You can cast bane once using a warlock spell slot. You can't do so again until you finish a long rest.",["Bane"],],
        "Thirsting Blade"=> [
          2,
          "Prerequisite: Pact of the Blade feature

          You can attack with your pact weapon twice, instead of once, whenever you take the Attack action on your turn.",
          [],
        ],
        "Visions of Distant Realms"=> [15,"You can cast arcane eye at will, without expending a spell slot.",["Arcane Eye"],],
        "Voice of the Chain Master"=> [
          2,
          "Prerequisite: Pact of the Chain feature

          You can communicate telepathically with your familiar and perceive through your familiar's senses as long as you are on the same plane of existence. Additionally, while perceiving through your familiar's senses, you can also speak through your familiar in your own voice, even if your familiar is normally incapable of speech.",
          [],
        ],
        "Whispers of the Grave"=> [9,"You can cast speak with dead at will, without expending a spell slot.",["Speak with Dead"],],
        "Witch Sight"=> [15,"You can see the true form of any shapechanger or creature concealed by illusion or transmutation magic while the creature is within 30 feet of you and within line of sight.",[],],
      },
    },
  },

)

Warlock.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Warlock.subclasses.create(
  name: "The Archfey",
  description: "Your patron is a lord or lady of the fey, a creature of legend who holds secrets that were forgotten before the mortal races were born. This being's motivations are often inscrutable, and sometimes whimsical, and might involve a striving for greater magical power or the settling of age-old grudges.",
  features: {
    1=>[
      "Fey Presence: Your patron bestows upon you the ability to project the beguiling and fearsome presence of the fey. As an action, you can cause each creature in a 10-foot cube originating from you to make a Wisdom saving throw against your warlock spell save DC. The creatures that fail their saving throws are all charmed or frightened by you (your choice) until the end of your next turn.

      Once you use this feature, you can't use it again until you finish a short or long rest.",
    ],
    6=>[
      "Misty Escape: You can vanish in a puff of mist in response to harm. When you take damage, you can use your reaction to turn invisible and teleport up to 60 feet to an unoccupied space you can see. You remain invisible until the start of your next turn or until you attack or cast a spell.

      Once you use this feature, you can't use it again until you finish a short or long rest.",
    ],
    10=>[
      "Beguiling Defenses: Your patron teaches you how to turn the mind-affecting magic of your enemies against them. You are immune to being charmed, and when another creature attempts to charm you, you can use your reaction to attempt to turn the charm back on that creature. The creature must succeed on a Wisdom saving throw against your warlock spell save DC or be charmed by you for 1 minute or until the creature takes any damage.",
    ],
    14=>[
      "Dark Delirium: You can plunge a creature into an illusory realm. As an action, choose a creature that you can see within 60 feet of you. It must make a Wisdom saving throw against your warlock spell save DC. On a failed save, it is charmed or frightened by you (your choice) for 1 minute or until your concentration is broken (as if you are concentrating on a spell). This effect ends early if the creature takes any damage.

      Until this illusion ends, the creature thinks it is lost in a misty realm, the appearance of which you choose. The creature can see and hear only itself, you, and the illusion.

      You must finish a short or long rest before you can use this feature again.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'expanded_spell_list'=> [
      "Faerie Fire",
      "Sleep",
      "Calm Emotions",
      "Phantasmal Force",
      "Blink",
      "Plant Growth",
      "Dominate Beast",
      "Greater Invisibility",
      "Dominate Person",
      "Seeming",
    ],
  },
)

Warlock.subclasses.create(
  name: "The Fiend",
  description: "You have made a pact with a fiend from the lower planes of existence, a being whose aims are evil, even if you strive against those aims. Such beings desire the corruption or destruction of all things, ultimately including you.",
  features: {
    1=>[
      "Dark One's Blessing: When you reduce a hostile creature to 0 hit points, you gain temporary hit points equal to your Charisma modifier + your warlock level (minimum of 1).",
    ],
    6=>[
      "Dark One's Own Luck: You can call on your patron to alter fate in your favor. When you make an ability check or a saving throw, you can use this feature to add a d10 to your roll. You can do so after seeing the initial roll but before any of the roll’s effects occur.

      Once you use this feature, you can’t use it again until you finish a short or long rest.",
    ],
    10=>[
      "Fiendish Resilience: You can choose one damage type when you finish a short or long rest. You gain resistance to that damage type until you choose a different one with this feature. Damage from magical weapons or silver weapons ignores this resistance.",
    ],
    14=>[
      "Hurl Through Hell: When you hit a creature with an attack, you can use this feature to instantly transport the target through the lower planes. The creature disappears and hurtles through a nightmare landscape.

      At the end of your next turn, the target returns to the space it previously occupied, or the nearest unoccupied space. If the target is not a fiend, it takes 10d10 psychic damage as it reels from its horrific experience.

      Once you use this feature, you can’t use it again until you finish a long rest.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'expanded_spell_list'=> [
      "Burning Hands",
      "Command",
      "Blindness/Deafness",
      "Scorching Ray",
      "Fireball",
      "Stinking Cloud",
      "Fire Shield",
      "Wall of Fire",
      "Flame Strike",
      "Hallow",
    ],
  },
)

Warlock.subclasses.create(
  name: "The Great Old One",
  description: "Your patron is a mysterious entity whose nature is utterly foreign to the fabric of reality. It might come from the Far Realm, the space beyond reality, or it could be one of the elder gods known only in legends. Its motives are incomprehensible to mortals, and its knowledge so immense and ancient that even the greatest libraries pale in comparison to the vast secrets it holds. ",
  features: {
    1=>[
      "Awakened Mind: Your alien knowledge gives you the ability to touch the minds of other creatures. You can telepathically speak to any creature you can see within 30 feet of you. You don't need to share a language with the creature for it to understand your telepathic utterances, but the creature must be able to understand at least one language.",
    ],
    6=>[
      "Entropic Ward: You learn to magically ward yourself against attack and to turn an enemy's failed strike into good luck for yourself. When a creature makes an attack roll against you, you can use your reaction to impose disadvantage on that roll. If the attack misses you, your next attack roll against the creature has advantage if you make it before the end of your next turn.

      Once you use this feature, you can't use it again until you finish a short or long rest.",
    ],
    10=>[
      "Thought Shield: Your thoughts can't be read by telepathy or other means unless you allow it. You also have resistance to psychic damage, and whenever a creature deals psychic damage to you, that creature takes the same amount of damage that you do.",
    ],
    14=>[
      "Create Thrall: You gain the ability to infect a humanoid's mind with the alien magic of your patron. You can use your action to touch an incapacitated humanoid. That creature is then charmed by you until a Remove Curse spell is cast on it, the charmed condition is removed from it, or you use this feature again.

      You can communicate telepathically with the charmed creature as long as the two of you are on the same plane of existence.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {
    'expanded_spell_list'=> [
      "Dissonant Whispers",
      "Tasha's Hideous Laughter",
      "Detect Thoughts",
      "Phantasmal Force",
      "Clairvoyance",
      "Sending",
      "Dominate Beast",
      "Evard's Black Tentacles",
      "Dominate Person",
      "Telekinesis",
    ],
  },
)

Wizard = PlayerClass.create(
  name: 'Wizard',
  hit_die: 6,
  starting_hp: 6,
  saving_throws: [3,4],
  armor: [],
  weapons: ['Dagger','Darts','Sling','Quarterstaff','Light Crossbow'],
  tools: [],
  skill_choices: ['Arcana','History','Insight','Investigation','Medicine','Religion'],
  num_skills: 2,
  equipment_choices: {
    'choices'=>[
      ['Quarterstaff#1','Dagger#1'],
      ['Component Pouch#1','Arcane Crystal#1'],
      ["Scholar's Pack#1","Explorer's Pack#1"],
    ],
    'default'=>['Spellbook#1'],
  },
  spellcasting_ability: 4,
  spell_table: [
    [-1,3,2,0,0,0,0,0,0,0,0],
    [-1,3,3,0,0,0,0,0,0,0,0],
    [-1,3,4,2,0,0,0,0,0,0,0],
    [-1,4,4,3,0,0,0,0,0,0,0],
    [-1,4,4,3,2,0,0,0,0,0,0],
    [-1,4,4,3,3,0,0,0,0,0,0],
    [-1,4,4,3,3,1,0,0,0,0,0],
    [-1,4,4,3,3,2,0,0,0,0,0],
    [-1,4,4,3,3,3,1,0,0,0,0],
    [-1,6,4,3,3,3,2,0,0,0,0],
    [-1,6,4,3,3,3,2,1,0,0,0],
    [-1,6,4,3,3,3,2,1,0,0,0],
    [-1,6,4,3,3,3,2,1,1,0,0],
    [-1,6,4,3,3,3,2,1,1,0,0],
    [-1,6,4,3,3,3,2,1,1,1,0],
    [-1,6,4,3,3,3,2,1,1,1,0],
    [-1,6,4,3,3,3,2,1,1,1,1],
    [-1,6,4,3,3,3,3,1,1,1,1],
    [-1,6,4,3,3,3,3,2,1,1,1],
    [-1,6,4,3,3,3,3,2,2,1,1],
  ],
  wealth_die: 5,
  features: {
    1=>[
      "Spellcasting: As a student of arcane magic, you have a spellbook containing spells that show the first glimmerings of your true power.",
      "Spellbook: You have a spellbook containing six 1st-level wizard spells of your choice. Your spellbook is the repository of the wizard spells you know, except your cantrips, which are fixed in your mind.

      The spells that you add to your spellbook as you gain levels reflect the arcane research you conduct on your own, as well as intellectual breakthroughs you have had about the nature of the multiverse. You might find other spells during your adventures. You could discover a spell recorded on a scroll in an evil wizard's chest, for example, or in a dusty tome in an ancient library.

      Each time you gain a wizard level, you can add two wizard spells of your choice to your spellbook. Each of these spells must be of a level for which you have spell slots, as shown on the Wizard table. On your adventures, you might find other spells that you can add to your spellbook.",
      "Arcane Recovery: You have learned to regain some of your magical energy by studying your spellbook. Once per day when you finish a short rest, you can choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your wizard level (rounded up), and none of the slots can be 6th level or higher.

      For example, if you're a 4th-level wizard, you can recover up to two levels worth of spell slots. You can recover either a 2nd-level spell slot or two 1st-level spell slots.",
    ],
    2=>[
      "Arcane Tradition: You choose an arcane tradition, shaping your practice of magic through one of the following schools. Your choice grants you features at 2nd level and again at 6th, 10th, and 14th level.",
    ],
    4=>[
      "Ability Score Increase:"
    ],
    12=>[
      "Ability Score Increase:"
    ],
    16=>[
      "Ability Score Increase:"
    ],
    18=>[
      "Spell Mastery: You have achieved such mastery over certain spells that you can cast them at will. Choose a 1st-level wizard spell and a 2nd-level wizard spell that are in your spellbook. You can cast those spells at their lowest level without expending a spell slot when you have them prepared. If you want to cast either spell at a higher level, you must expend a spell slot as normal.

      By spending 8 hours in study, you can exchange one or both of the spells you chose for different spells of the same levels.",
    ],
    19=>[
      "Ability Score Increase:"
    ],
    20=>[
      "Signature Spells: You gain mastery over two powerful spells and can cast them with little effort. Choose two 3rd-level wizard spells in your spellbook as your signature spells. You always have these spells prepared, they don't count against the number of spells you have prepared, and you can cast each of them once at 3rd level without expending a spell slot. When you do so, you can't do so again until you finish a short or long rest.

      If you want to cast either spell at a higher level, you must expend a spell slot as normal.",
    ]
  },
  leveled_choice: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Wizard.subclasses.create(
  name: "None",
  features: {},
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Wizard.subclasses.create(
  name: "Abjuration",
  description: "The School of Abjuration emphasizes magic that blocks, banishes, or protects. Detractors of this school say that its tradition is about denial, negation rather than positive assertion. You understand, however, that ending harmful effects, protecting the weak, and banishing evil influences is anything but a philosophical void. It is a proud and respected vocation.

  Called abjurers, members of this school are sought when baleful spirits require exorcism, when important locations must be guarded against magical spying, and when portals to other planes of existence must be closed.",
  features: {
    2=>[
      "Abjuration Savant: The gold and time you must spend to copy a abjuration spell into your spellbook is halved.",
      "Arcane Ward: You can weave magic around yourself for protection. When you cast an abjuration spell of 1st level or higher, you can simultaneously use a strand of the spell's magic to create a magical ward on yourself that lasts until you finish a long rest. The ward has hit points equal to twice your wizard level + your Intelligence modifier. Whenever you take damage, the ward takes the damage instead. If this damage reduces the ward to 0 hit points, you take any remaining damage.

      While the ward has 0 hit points, it can't absorb damage, but its magic remains. Whenever you cast an abjuration spell of 1st level or higher, the ward regains a number of hit points equal to twice the level of the spell.

      Once you create the ward, you can't create it again until you finish a long rest.",
    ],
    6=>[
      "Projected Ward: When a creature that you can see within 30 feet of you takes damage, you can use your reaction to cause your Arcane Ward to absorb that damage. If this damage reduces the ward to 0 hit points, the warded creature takes any remaining damage.",
    ],
    10=>[
      "Improved Abjuration: When you cast an abjuration spell that requires you to make an ability check as a part of casting that spell (as in Counterspell and Dispel Magic), you add your proficiency bonus to that ability check.",
    ],
    14=>[
      "Spell Resistance: You have advantage on saving throws against spells.

      Furthermore, you have resistance against the damage of spells.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Wizard.subclasses.create(
  name: "Conjuration",
  description: "As a conjurer, you favor spells that produce objects and creatures out of thin air. You can conjure billowing clouds of killing fog or summon creatures from elsewhere to fight on your behalf. As your mastery grows, you learn spells of transportation and can teleport yourself across vast distances, even to other planes of existence, in an instant.",
  features: {
    2=>[
      "Conjuration Savant: The gold and time you must spend to copy a Conjuration spell into your spellbook is halved.",
      "Minor Conjuration: You can use your action to conjure up an inanimate object in your hand or on the ground in an unoccupied space that you can see within 10 feet of you. This object can be no larger than 3 feet on a side and weigh no more than 10 pounds, and its form must be that of a nonmagical object that you have seen. The object is visibly magical, radiating dim light out to 5 feet.

      The object disappears after 1 hour, when you use this feature again, or if it takes or deals any damage.",
    ],
    6=>[
      "Benign Transportation: You can use your action to teleport up to 30 feet to an unoccupied space that you can see. Alternatively, you can choose a space within range that is occupied by a Small or Medium creature. If that creature is willing, you both teleport, swapping places.

      Once you use this feature, you can't use it again until you finish a long rest or you cast a conjuration spell of 1st level or higher.",
    ],
    10=>[
      "Focused Conjuration: While you are concentrating on a conjuration spell, your concentration can't be broken as a result of taking damage.",
    ],
    14=>[
      "Durable Summons: Any creature that you summon or create with a conjuration spell has 30 temporary hit points.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Wizard.subclasses.create(
  name: "Divination",
  description: "The counsel of a diviner is sought by royalty and commoners alike, for all seek a clearer understanding of the past, present, and future. As a diviner, you strive to part the veils of space, time, and consciousness so that you can see clearly. You work to master spells of discernment, remote viewing, supernatural knowledge, and foresight.",
  features: {
    2=>[
      "Divination Savant: The gold and time you must spend to copy a Divination spell into your spellbook is halved.",
      "Portent: Glimpses of the future begin to press in on your awareness. When you finish a long rest, roll two d20s and record the numbers rolled. You can replace any attack roll, saving throw, or ability check made by you or a creature that you can see with one of these foretelling rolls. You must choose to do so before the roll, and you can replace a roll in this way only once per turn.

      Each foretelling roll can be used only once. When you finish a long rest, you lose any unused foretelling rolls.",
    ],
    6=>[
      "Expert Divination: Casting divination spells comes so easily to you that it expends only a fraction of your spellcasting efforts. When you cast a divination spell of 2nd level or higher using a spell slot, you regain one expended spell slot. The slot you regain must be of a level lower than the spell you cast and can't be higher than 5th level.",
    ],
    10=>[
      "The Third Eye: You can use your action to increase your powers of perception. When you do so, choose one of the following benefits, which lasts until you are incapacitated or you take a short or long rest. You can't use the feature again until you finish a short or long rest.

      Darkvision. You gain darkvision out to a range of 60 feet.

      Ethereal Sight. You can see into the Ethereal Plane within 60 feet of you.

      Greater Comprehension. You can read any language.

      See Invisibility. You can see invisible creatures and objects within 10 feet of you that are within line of sight.",
    ],
    14=>[
      "Greater Portent: The visions in your dreams intensify and paint a more accurate picture in your mind of what is to come. You roll three d20s for your Portent feature, rather than two.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Wizard.subclasses.create(
  name: "Enchantment",
  description: "As a member of the School of Enchantment, you have honed your ability to magically entrance and beguile other people and monsters. Some enchanters are peacemakers who bewitch the violent to lay down their arms and charm the cruel into showing mercy. Others are tyrants who magically bind the unwilling into their service. Most enchanters fall somewhere in between.",
  features: {
    2=>[
      "Enchantment Savant: The gold and time you must spend to copy a Enchantment spell into your spellbook is halved.",
      "Hypnotic Gaze: Your soft words and enchanting gaze can magically enthrall another creature. As an action, choose one creature that you can see within 5 feet of you. If the target can see or hear you, it must succeed on a Wisdom saving throw against your wizard spell save DC or be charmed by you until the end of your next turn. The charmed creature's speed drops to 0, and the creature is incapacitated and visibly dazed.

      On subsequent turns, you can use your action to maintain this effect, extending its duration until the end of your next turn. However, the effect ends if you move more than 5 feet away from the creature, if the creature can neither see nor hear you, or if the creature takes damage.

      Once the effect ends, or if the creature succeeds on its initial saving throw against this effect, you can't use this feature on that creature again until you finish a long rest.",
    ],
    6=>[
      "Instinctive Charm: When a creature you can see within 30 feet of you makes an attack roll against you, you can use your reaction to divert the attack, provided that another creature is within the attack's range. The attacker must make a Wisdom saving throw against your wizard spell save DC. On a failed save, the attacker must target the creature that is closest to it, not including you or itself. If multiple creatures are closest, the attacker chooses which one to target.

      On a successful save, you can't use this feature on the attacker again until you finish a long rest.

      You must choose to use this feature before knowing whether the attack hits or misses. Creatures that can't be charmed are immune to this effect.",
    ],
    10=>[
      "Split Enchantment: When you cast an enchantment spell of 1st level or higher that targets only one creature, you can have it target a second creature.",
    ],
    14=>[
      "Alter Memories: You gain the ability to make a creature unaware of your magical influence on it. When you cast an enchantment spell to charm one or more creatures, you can alter one creature's understanding so that it remains unaware of being charmed.

      Additionally, once before the spell expires, you can use your action to try to make the chosen creature forget some of the time it spent charmed. The creature must succeed on an Intelligence saving throw against your wizard spell save DC or lose a number of hours of its memories equal to 1 + your Charisma modifier (minimum 1). You can make the creature forget less time, and the amount of time can't exceed the duration of your enchantment spell.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Wizard.subclasses.create(
  name: "Evocation",
  description: "You focus your study on magic that creates powerful elemental effects such as bitter cold, searing flame, rolling thunder, crackling lightning, and burning acid. Some evokers find employment in military forces, serving as artillery to blast enemy armies from afar. Others use their spectacular power to protect the weak, while some seek their own gain as bandits, adventurers, or aspiring tyrants.",
  features: {
    2=>[
      "Evocation Savant: The gold and time you must spend to copy a Evocation spell into your spellbook is halved.",
      "Sculpt Spells: You can create pockets of relative safety within the effects of your evocation spells. When you cast an evocation spell that affects other creatures that you can see, you can choose a number of them equal to 1 + the spell's level. The chosen creatures automatically succeed on their saving throws against the spell, and they take no damage if they would normally take half damage on a successful save.",
    ],
    6=>[
      "Potent Cantrip: Your damaging cantrips affect even creatures that avoid the brunt of the effect. When a creature succeeds on a saving throw against your cantrip, the creature takes half the cantrip's damage (if any) but suffers no additional effect from the cantrip.",
    ],
    10=>[
      "Empowered Evocation: You can add your Intelligence modifier (minimum of +1) to one damage roll of any wizard evocation spell that you cast.",
    ],
    14=>[
      "Overchannel: You can increase the power of your simpler spells. When you cast a wizard spell of 1st through 5th level that deals damage, you can deal maximum damage with that spell.

      The first time you do so, you suffer no adverse effect. If you use this feature again before you finish a long rest, you take 2d12 necrotic damage for each level of the spell, immediately after you cast it. Each time you use this feature again before finishing a long rest, the necrotic damage per spell level increases by 1d12. This damage ignores resistance and immunity.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Wizard.subclasses.create(
  name: "Illusion",
  description: "You focus your studies on magic that dazzles the senses, befuddles the mind, and tricks even the wisest folk. Your magic is subtle, but the illusions crafted by your keen mind make the impossible seem real. Some illusionists – including many gnome wizards – are benign tricksters who use their spells to entertain. Others are more sinister masters of deception, using their illusions to frighten and fool others for their personal gain.",
  features: {
    2=>[
      "Illusion Savant: The gold and time you must spend to copy a Illusion spell into your spellbook is halved.",
      "Improved Minor Illusion: You learn the Minor Illusion cantrip. If you already know this cantrip, you learn a different wizard cantrip of your choice. The cantrip doesn't count against your number of cantrips known.

      When you cast Minor Illusion, you can create both a sound and an image with a single casting of the spell.",
    ],
    6=>[
      "Malleable Illusions: When you cast an illusion spell that has a duration of 1 minute or longer, you can use your action to change the nature of that illusion (using the spell's normal parameters for the illusion), provided that you can see the illusion.",
    ],
    10=>[
      "Illusory Self: You can create an illusory duplicate of yourself as an instant, almost instinctual reaction to danger. When a creature makes an attack roll against you, you can use your reaction to interpose the illusory duplicate between the attacker and yourself. The attack automatically misses you, then the illusion dissipates.

      Once you use this feature, you can't use it again until you finish a short or long rest.",
    ],
    14=>[
      "Illusory Reality: You have learned the secret of weaving shadow magic into your illusions to give them a semi-reality. When you cast an illusion spell of 1st level or higher, you can choose one inanimate, nonmagical object that is part of the illusion and make that object real. You can do this on your turn as a bonus action while the spell is ongoing. The object remains real for 1 minute. For example, you can create an illusion of a bridge over a chasm and then make it real long enough for your allies to cross.

      The object can't deal damage or otherwise directly harm anyone.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Wizard.subclasses.create(
  name: "Necromancy",
  description: "The School of Necromancy explores the cosmic forces of life, death, and undeath. As you focus your studies in this tradition, you learn to manipulate the energy that animates all living things. As you progress, you learn to sap the life force from a creature as your magic destroys its body, transforming that vital energy into magical power you can manipulate.

  Most people see necromancers as menacing, or even villainous, due to the close association with death. Not all necromancers are evil, but the forces they manipulate are considered taboo by many societies.",
  features: {
    2=>[
      "Necromancy Savant: The gold and time you must spend to copy a Necromancy spell into your spellbook is halved.",
      "Grim harvest: You gain the ability to reap life energy from creatures you kill with your spells. Once per turn when you kill one or more creatures with a spell of 1st level or higher, you regain hit points equal to twice the spell's level, or three times its level if the spell belongs to the School of Necromancy. You don't gain this benefit for killing constructs or undead.",
    ],
    6=>[
      "Undead Thralls: You add the Animate Dead spell to your spellbook if it is not there already. When you cast Animate Dead, you can target one additional corpse or pile of bones, creating another zombie or skeleton, as appropriate.

      Whenever you create an undead using a necromancy spell, it has additional benefits:

      The creature's hit point maximum is increased by an amount equal to your wizard level.
      The creature adds your proficiency bonus to its weapon damage rolls.",
    ],
    10=>[
      "Injured to Undeath: You have resistance to necrotic damage, and your hit point maximum can't be reduced. You have spent so much time dealing with undead and the forces that animate them that you have become inured to some of their worst effects.",
    ],
    14=>[
      "Command Undead: You can use magic to bring undead under your control, even those created by other wizards. As an action, you can choose one undead that you can see within 60 feet of you. That creature must make a Charisma saving throw against your wizard spell save DC. If it succeeds, you can't use this feature on it again. If it fails, it becomes friendly to you and obeys your commands until you use this feature again.

      Intelligent undead are harder to control in this way. If the target has an Intelligence of 8 or higher, it has advantage on the saving throw. If it fails the saving throw and has an Intelligence of 12 or higher, it can repeat the saving throw at the end of every hour until it succeeds and breaks free.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Wizard.subclasses.create(
  name: "Transmutation",
  description: "You are a student of spells that modify energy and matter. To you, the world is not a fixed thing, but eminently mutable, and you delight in being an agent of change. You wield the raw stuff of creation and learn to alter both physical forms and mental qualities. Your magic gives you the tools to become a smith on reality's forge.

  Some transmuters are tinkerers and pranksters, turning people into toads and transforming copper into silver for fun and occasional profit. Others pursue their magical studies with deadly seriousness, seeking the power of the gods to make and destroy worlds.",
  features: {
    2=>[
      "Transmutation Savant: The gold and time you must spend to copy a Transmutation spell into your spellbook is halved.",
      "Minor Alchemy: You can temporarily alter the physical properties of one nonmagical object, changing it from one substance into another. You perform a special alchemical procedure on one object composed entirely of wood, stone (but not a gemstone), iron, copper, or silver, transforming it into a different one of those materials. For each 10 minutes you spend performing the procedure, you can transform up to 1 cubic foot of material. After 1 hour, or until you lose your concentration (as if you were concentrating on a spell), the material reverts to its original substance.",
    ],
    6=>[
      "Transmuter's Stone: You can spend 8 hours creating a transmuter's stone that stores transmutation magic. You can benefit from the stone yourself or give it to another creature. A creature gains a benefit of your choice as long as the stone is in the creature's possession. When you create the stone, choose the benefit from the following options:

      Darkvision out to a range of 60 feet
      An increase to speed of 10 feet while the creature is unencumbered
      Proficiency in Constitution saving throws
      Resistance to acid, cold, fire, lightning, or thunder damage (your choice whenever you choose this benefit)
      Each time you cast a transmutation spell of 1st level or higher, you can change the effect of your stone if the stone is on your person.

      If you create a new transmuter's stone, the previous one ceases to function.",
    ],
    10=>[
      "Shapechanger: You add the Polymorph spell to your spellbook, if it is not there already. You can cast Polymorph without expending a spell slot. When you do so, you can target only yourself and transform into a beast whose challenge rating is 1 or lower.

      Once you cast Polymorph in this way, you can't do so again until you finish a short or long rest, though you can still cast it normally using an available spell slot.",
    ],
    14=>[
      "Master Transmuter: You can use your action to consume the reserve of transmutation magic stored within your transmuter's stone in a single burst. When you do so, choose one of the following effects. Your transmuter's stone is destroyed and can't be remade until you finish a long rest.

      Major Transformation. You can transmute one nonmagical object – no larger than a 5-foot cube – into another nonmagical object of similar size and mass and of equal or lesser value. You must spend 10 minutes handling the object to transform it.

      Panacea. You remove all curses, diseases, and poisons affecting a creature that you touch with the transmuter's stone. The creature also regains all its hit points.

      Restore Life. You cast the Raise Dead spell on a creature you touch with the transmuter's stone, without expending a spell slot or needing to have the spell in your spellbook.

      Restore Youth. You touch the transmuter's stone to a willing creature, and that creature's apparent age is reduced by 3d10 years, to a minimum of 13 years. This effect doesn't extend the creature's lifespan.",
    ],
  },
  leveled_choice: {},
  equipment_choices: {},
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Acolyte = Background.create(
  name: "Acolyte",
  description: 'You have spent your life in the service of a temple. You act as an intermediary between the realm of the holy and the mortal world.',
  skills: ['Insight', 'Religion'],
  extra_languages: 2,
  equipment_choices: {
    'choices'=>[['Longsword#1','martial#1']],
    'default'=>[
      'Holy Emblem#1',
      'Prayer Book#1',
      'Incense#5',
      'Clothes, sacred vestments#1',
      'Clothes, common#1',
    ],
  },
  gold: 15,
  traits: [
    'I idolize a particular hero of my faith, and constantly refer to that person`s deeds and example.',
    'I can find common ground between the fiercest enemies, empathizing with them and always working toward peace.',
    'I see omens in every event and action. The gods try to speak to us, we just need to listen.',
    'Nothing can shake my optimistic attitude.',
    'I quote (or misquote) sacred texts and proverbs in almost every situation.',
    'I am tolerant (or intolerant) of other faiths and respect (or condemn) the worship of other gods.',
    'I’ve enjoyed fine food, drink, and high society among my temple’s elite. Rough living grates on me.',
    'I’ve spent so long in the temple that I have little practical experience dealing with people in the outside world.',
  ],
  ideals: [
    'Tradition. The ancient traditions of worship and sacrifice must be preserved and upheld. (Lawful)',
    'Charity. I always try to help those in need, no matter what the personal cost. (Good)',
    'Change. We must help bring about the changes the gods are constantly working in the world. (Chaotic)',
    'Power. I hope to one day rise to the top of my faith’s religious hierarchy. (Lawful)',
    'Faith. I trust that my deity will guide my actions. I have faith that if I work hard, things will go well. (Lawful)',
    'Aspiration. I seek to prove myself worthy of my god’s favor by matching my actions against his or her teachings. (Any)',
  ],
  bonds: [
    'I would die to recover an ancient relic of my faith that was lost long ago.',
    'I will someday get revenge on the corrupt temple hierarchy who branded me a heretic.',
    'I owe my life to the priest who took me in when my parents died.',
    'Everything I do is for the common people.',
    'I will do anything to protect the temple where I served.',
    'I seek to preserve a sacred text that my enemies consider heretical and seek to destroy.',
  ],
  flaws: [
    'I judge others harshly, and myself even more severely.',
    'I put too much trust in those who wield power within my temple’s hierarchy.',
    'My piety sometimes leads me to blindly trust those that profess faith in my god.',
    'I am inflexible in my thinking.',
    'I am suspicious of strangers and expect the worst of them.',
    'Once I pick a goal, I become obsessed with it to the detriment of everything else in my life.',
  ],
  features: [
      'Shelter of the Faithful: You command the respect of those who share your faith, and you can perform the religious ceremonies of your deity. You and your party can expect to receive free healing and care at a temple, shrine, or other established presence of your faith, though you must provide any material components needed for spells. Those who share your religion will support you at a modest lifestyle. You might have ties to a specific temple where you have a residence and the priests can be called upon for non-hazardous assistance near there.',
      'Proficiencies: Insight and Religion',
    ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Bacolyte = Background.create(
  name: "Bacolyte",
  description: 'You have spent your life in the service of a temple. You act as an intermediary between the realm of the holy and the mortal world.',
  skills: ['Insight', 'Religion'],
  extra_languages: 2,
  equipment_choices: {
    'choices'=>[['Longsword#1','martial#1']],
    'default'=>[
      'Holy Emblem#1',
      'Prayer Book#1',
      'Incense#5',
      'Clothes, sacred vestments#1',
      'Clothes, common#1',
    ],
  },
  gold: 15,
  traits: [
    'I idolize a particular hero of my faith, and constantly refer to that person`s deeds and example.',
    'I can find common ground between the fiercest enemies, empathizing with them and always working toward peace.',
    'I see omens in every event and action. The gods try to speak to us, we just need to listen.',
    'Nothing can shake my optimistic attitude.',
    'I quote (or misquote) sacred texts and proverbs in almost every situation.',
    'I am tolerant (or intolerant) of other faiths and respect (or condemn) the worship of other gods.',
    'I’ve enjoyed fine food, drink, and high society among my temple’s elite. Rough living grates on me.',
    'I’ve spent so long in the temple that I have little practical experience dealing with people in the outside world.',
  ],
  ideals: [
    'Tradition. The ancient traditions of worship and sacrifice must be preserved and upheld. (Lawful)',
    'Charity. I always try to help those in need, no matter what the personal cost. (Good)',
    'Change. We must help bring about the changes the gods are constantly working in the world. (Chaotic)',
    'Power. I hope to one day rise to the top of my faith’s religious hierarchy. (Lawful)',
    'Faith. I trust that my deity will guide my actions. I have faith that if I work hard, things will go well. (Lawful)',
    'Aspiration. I seek to prove myself worthy of my god’s favor by matching my actions against his or her teachings. (Any)',
  ],
  bonds: [
    'I would die to recover an ancient relic of my faith that was lost long ago.',
    'I will someday get revenge on the corrupt temple hierarchy who branded me a heretic.',
    'I owe my life to the priest who took me in when my parents died.',
    'Everything I do is for the common people.',
    'I will do anything to protect the temple where I served.',
    'I seek to preserve a sacred text that my enemies consider heretical and seek to destroy.',
  ],
  flaws: [
    'I judge others harshly, and myself even more severely.',
    'I put too much trust in those who wield power within my temple’s hierarchy.',
    'My piety sometimes leads me to blindly trust those that profess faith in my god.',
    'I am inflexible in my thinking.',
    'I am suspicious of strangers and expect the worst of them.',
    'Once I pick a goal, I become obsessed with it to the detriment of everything else in my life.',
  ],
  features: [
      'Shelter of the Faithful: You command the respect of those who share your faith, and you can perform the religious ceremonies of your deity. You and your party can expect to receive free healing and care at a temple, shrine, or other established presence of your faith, though you must provide any material components needed for spells. Those who share your religion will support you at a modest lifestyle. You might have ties to a specific temple where you have a residence and the priests can be called upon for non-hazardous assistance near there.',
      'Proficiencies: Insight and Religion',
    ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Feat_alert = Feat.create(
  name: 'Alert',
  description: 'Always on the lookout for danger, you won`t be fooled by just anyone.',
  features: [
      'You gain +5 to initiative.',
      'You can`t be surprised while you are conscious.',
      'Other creatures don`t gain advantage on attack rolls against you as a result of being unseen by you.',
    ],
  extra_spells: {},
  specific_spells: {},
  custom_mods: {},
)

Spell.create(
  name: 'Acid Splash',
  description: 'You hurl a bubble of acid. Choose one creature within range, or choose two creatures within range that are within 5 feet of each other. A target must succeed on a Dexterity saving throw or take 1d6 acid damage.',
  school: 'conjuration',
  range: '60 feet',
  attack: 'true',
  atk_dmg: {
    1=> '1d6',
    5=> '2d6',
    11=> '3d6',
    17=> '4d6',
  },
  dmg_type: 'Acid',
  id: 1,
)

Spell.create(
  name: 'Aid',
  level: 2,
  description: 'Your spell bolsters your allies with toughness and resolve. Choose up to three creatures within range. Each target’s hit point maximum and current hit points increase by 5 for the duration.

  At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, a target’s hit points increase by an additional 5 for each slot level above 2nd.',
  school: 'abjuration',
  range: '30 feet',
  components: ['V','S','M (a tiny strip of white cloth)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  id: 2,
)

Spell.create(
  name: 'Alarm',
  level: 1,
  description: "You set an alarm against unwanted intrusion. Choose a door, a window, or an area within range that is no larger than a 20-foot cube. Until the spell ends, an alarm alerts you whenever a Tiny or larger creature touches or enters the warded area. When you cast the spell, you can designate creatures that won't set off the alarm. You also choose whether the alarm is mental or audible.
    A mental alarm alerts you with a ping in your mind if you are within 1 mile of the warded area. This ping awakens you if you are sleeping.
    An audible alarm produces the sound of a hand bell for 10 seconds within 60 feet
    ",
  ritual: 1,
  school: 'abjuration',
  cast_time: '1 minute',
  range: '30 feet',
  components: ['V','S','M (a tiny bell and a piece of fine silver wire)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 3,
)

Spell.create(
  name: 'Alter Self',
  level: 2,
  description: "You assume a different form. When you cast the spell, choose one of the following options, the effects of which last for the duration of the spell. While the spell lasts, you can end one option as an action to gain the benefits of a different one.

  Aquatic Adaptation: You adapt your body to an aquatic environment, sprouting gills, and growing webbing between your fingers. You can breathe underwater and gain a swimming speed equal to your walking speed.

  Change Appearance: You transform your appearance. You decide what you look like, including your height, weight, facial features, sound of your voice, hair length, coloration, and distinguishing characteristics, if any. You can make yourself appear as a member of another race, though none of your statistics change. You also don't appear as a creature of a different size than you, and your basic shape stays the same, if you're bipedal, you can't use this spell to become quadrupedal, for instance. At any time for the duration of the spell, you can use your action to change your appearance in this way again.

  Natural Weapons: You grow claws, fangs, spines, horns, or a different natural weapon of your choice. Your unarmed strikes deal 1d6 bludgeoning, piercing, or slashing damage, as appropriate to the natural weapon you chose, and you are proficient with your unarmed strikes. Finally, the natural weapon is magic and you have a +1 bonus to the attack and damage rolls you make using it.",
  school: 'transmutation',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 4,
)

Spell.create(
  name: 'Animal Friendship',
  level: 1,
  description: "This spell lets you convince a beast that you mean it no harm. Choose a beast that you can see within range. It must see and hear you. If the beast’s Intelligence is 4 or higher, the spell fails. Otherwise, the beast must succeed on a Wisdom saving throw or be charmed by you for the spell’s duration. If you or one of your companions harms the target, the spells ends.

  At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can affect one additional beast for each slot level above 1st.",
  school: 'enchantment',
  range: '30 feet',
  components: ['V','S','M (a moresel of food)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 5,
)

Spell.create(
  name: 'Animal Messenger',
  level: 2,
  description: "By means of this spell, you use an animal to deliver a message. Choose a Tiny beast you can see within range, such as a squirrel, a blue ray, or a bird. You specify a location, which you must have visited, and a recipient who matches a general description, such as a man or woman dressed in the uniform of the town guard or a red-haired dwarf wearing a pointed hat. You also speak a message of up to twenty-five words. The target beast travels for the duration of the spell towards the specified location, covering about 50 miles per 24 hours for a flying messenger or 25 miles for other animals.

  When the messenger arrives, it delivers your message to the creature that you described, replicating the sound of your voice. The messenger speaks only to a creature matching the description you gave. If the messenger doesn't reach its destination before the spell ends, the message is lost, and the beast makes its way back to where you cast this spell.

  At Higher Levels: If you cast this spell using a spell slot of 3rd level or higher, the duration of the spell increases by 48 hours for each slot level above 2nd.",
  school: 'enchantment',
  ritual: 1,
  range: '30 feet',
  components: ['V','S','M (a morsel of food)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 6,
)

Spell.create(
  name: 'Animal Shapes',
  level: 8,
  description: "Your magic turns others into beasts. Choose any number of willing creatures that you can see within range. You transform each target into the form of a large or smaller beast with a challenge rating of 4 or lower. On subsequent turns, you can use your actions to transform affected creatures into new forms.

The transformation lasts for the duration for each target, or until the target drops to 0 hit points or dies. You can choose a different form for each target. A target's game statistics are replaced by the statistics of the chosen beast, though the target retains its alignment and Intelligence, Wisdom, and Charisma scores. The target assumes the hit points of its new form, and when it reverts to its normal form, it returns to the number of hit point it had before it transformed. If it reverts as a result of dropping to 0 hit points, any excess damage carries over to its normal form. As long as the excess damage doesn't reduce the creature's normal form to 0 hit points, it isn't knocked unconscious. The creature is limited in the actions it can perform by the nature of its new form, and it can't speak or cast spells.

The target's gear melds into the new form. The target can't activate, wield, or otherwise benefit from any of its equipment.",
  school: 'transmutation',
  range: '30 feet',
  duration: 'Concentration, up to 24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 7,
)

Spell.create(
  name: 'Animate Dead',
  level: 3,
  description: "This spell creates an undead servant. Choose a pile of bones or a corpse of a Medium or Small humanoid within range. Your spell imbues the target with a foul mimicry of life, raising it as an undead creature. The target becomes a skeleton if you chose bones or a zombie if you chose a corpse (the DM has the creature's game statistics).

On each of your turns, you can use a bonus action to mentally command any creature you made with this spell if the creature is within 60 feet of you (if you control multiple creatures, you can command any or all of them at the same time, issuing the same command to each one). You decide what action the creature will take and where it will move during its next turn, or you can issue a general command, such as to guard a particular chamber or corridor. If you issue no commands, the creature only defends itself against hostile creatures. Once given an order, the creature continues to follow it until its task is complete.

The creature is under your control for 24 hours, after which it stops obeying any command you've given it. To maintain the control of the creature for another 24 hours, you must cast this spell on the creature again before the current 24-hour period ends. This use of the spell reasserts your control over up to four creatures you have animated with this spell, rather than animating a new one.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, you animate or reassert control over two additional undead creatures for each slot above 3rd. Each of the creatures must come from a different corpse or pile of bones.",
  school: 'necromancy',
  cast_time: '1 minute',
  range: '10 feet',
  components: ['V','S','M (a drop of blood, a piece of flesh, and a pinch of bone dust)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 8,
)

Spell.create(
  name: 'Animate Objects',
  level: 5,
  description: "Objects come to life at your command. Choose up to ten nonmagical objects within range that are not being worn or carried. Medium targets count as two objects, Large targets count as four objects, Huge targets count as eight objects. You can't animate any object larger than Huge. Each target animates and becomes a creature under your control until the spell ends or until reduced to 0 hit points.

As a bonus action, you can mentally command any creature you made with this spell if the creature is within 500 feet of you (if you control multiple creatures, you can command any or all of them at the same time, issuing the same command to each one). You decide what action the creature will take and where it will move during its next turn, or you can issue a general command, such as to guard a particular chamber or corridor. If you issue no commands, the creature only defends itself against hostile creatures. Once given an order, the creature continues to follow it until its task is complete.

At Higher Levels: If you cast this spell using a spell slot of 6th level or higher, you can animate two additional objects for each slot level above 5th.",
  school: 'transmutation',
  range: '120 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 9,
)

Spell.create(
  name: 'Antilife Shell',
  level: 5,
  description: "A shimmering barrier extends out from you in a 10-foot radius and moves with you, remaining centered on you and hedging out creatures other than undead and constructs.

The barrier lasts for the duration. The barrier prevents an affected creature from passing or reaching through. An affected creature can cast spells or make attacks with ranged or reach weapons through the barrier.

If you move so that an affect creature is forced to pass through the barrier, the spell ends.",
  school: 'abjuration',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 10,
)

Spell.create(
  name: 'Antimagic Field',
  level: 8,
  description: "A 10-foot-radius invisible sphere of antimagic surrounds you. This area is divorced from the magical energy that suffuses the multiverse. Within the sphere, spells can't be cast, summoned creatures disappear, and even magic items become mundane. Until the spell ends, the sphere moves with you, centered on you.

Spells and other magical effects, except those created by an artifact or a deity, are suppressed in the sphere and can't protrude into it. A slot expended to cast a suppressed spell is consumed. While an effect is suppressed, it doesn't function, but the time it spends suppressed counts against its duration.",
  school: 'abjuration',
  components: ['V','S','M (a piunch of powdered iron or iron filings)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 11,
)

Spell.create(
  name: 'Antipathy/Sympathy',
  level: 8,
  description: "This spell attracts or repels creatures of your choice. You target something within range, either a Huge or smaller object or creature or an area that is no larger than a 200-foot cube. Then specify a kind of intelligent creature, such as red dragons, goblins, or vampires. You invest the target with an aura that either attracts or repels the specified creatures for the duration. Choose antipathy or sympathy as the aura's effect.",
  school: 'enchantment',
  cast_time: '1 hour',
  range: '60 feet',
  components: ['V','S','M (either a lump of alum soaked in vinegar for antipathy, or a drop of honey for sympathy)'],
  duration: '10 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 12,
)

Spell.create(
  name: 'Arcane Eye',
  level: 4,
  description: "You create an invisible, magical eye within range that hovers in the air for the duration.

You mentally receive visual information from the eye, which has normal vision and darkvision out to 30 feet. The eye can look in every direction.

As an action, you can move the eye up to 30 feet in any direction. There is no limit to how far away from you the eye can move, but it can't enter another plane of existence. A solid barrier blocks the eye's movement, but the eye can pass through an opening as small as 1 inch in diameter.",
  school: 'divination',
  range: '30 feet',
  components: ['V','S','M (a bit of bat fur)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 13,
)

Spell.create(
  name: 'Arcane Gate',
  level: 6,
  description: "You create linked teleportation portals that remain open for the duration. Choose two points on the ground that you can see, one point within 10 feet of you and one point within 500 feet of you. A circular portal, 10 feet in diameter, opens over each point. If the portal would open in the space occupied by a creature, the spell fails, and the casting is lost.

The portals are two-dimensional glowing rings filled with mist, hovering inches from the ground and perpendicular to it at the points you choose. A ring is visible only from one side (your choice), which is the side that functions as a portal.

Any creature or object entering the portal exits from the other portal as if the two were adjacent to each other; passing through a portal from the nonportal side has no effect. The mist that fills each portal is opaque and blocks vision through it. On your turn, you can rotate the rings as a bonus action so that the active side faces in a different direction.",
  school: 'conjuration',
  range: '500 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 14,
)

Spell.create(
  name: 'Arcane Lock',
  level: 2,
  description: "You touch a closed door, window, gate, chest, or other entryway, and it becomes locked for the duration. You and the creatures you designate when you cast this spell can open the object normally. You can also set a password that, when spoken within 5 feet of the object, suppresses this spell for 1 minute. Otherwise, it is impassable until it is broken or the spell is dispelled or suppressed. Casting knock on the object suppresses arcane lock for 10 minutes.

While affected by this spell, the object is more difficult to break or force open; the DC to break it or pick any locks on it increases by 10.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S','M (gold dust worth at least 25gp)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 15,
)

Spell.create(
  name: 'Armor of Agathys',
  level: 1,
  description: "A protective magical force surrounds you, manifesting as a spectral frost that covers you and your gear. You gain 5 temporary hit points for the duration. If a creature hits you with a melee attack while you have these hit points, the creature takes 5 cold damage.

At Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, both the temporary hit points and the cold damage increase by 5 for each slot.",
  school: 'abjuration',
  components: ['V','S','M (a cup of water)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 16,
)

Spell.create(
  name: 'Arms of Hadar',
  level: 1,
  description: "",
  school: 'conjuration',
  attack: 'true',
  atk_dmg: {
    1=> '2d6',
  },
  dmg_type: 'Necrotic',
  id: 17,
)

Spell.create(
  name: 'Astral Projection',
  level: 9,
  description: "You and up to eight willing creatures within range project your astral bodies into the Astral Plane (the spell fails and the casting is wasted if you are already on that plane). The material body you leave behind is unconscious and in a state of suspended animation, it doesn't need food or air and doesn't age.

Your astral body resembles your mortal form in almost every way, replicating your game statistics and possessions. The principal difference is the addition of a silvery cord that extends from between your shoulder blades and trails behind you, fading to invisibility after 1 foot. This cord is your tether to your material body. As long as the tether remains intact, you can find your way home. If the cord is cut-something that can happen only when an effect specifically states that it does-your soul and body are separated, killing you instantly.
",
  school: 'necromancy',
  cast_time: '1 hour',
  range: '10 feet',
  components: ['V','S','M (for each creature you affect with this spell, you must provide one jacinth worth at least 1,000 gp and one ornately carved bar of silver worth at least 100gp, all of which the spell consumes)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 18,
)

Spell.create(
  name: 'Augury',
  level: 2,
  description: "By casting gem-inlaid sticks, rolling dragon bones, laying out ornate cards, or employing some other divining tool, you receive an omen from an otherworldly entity about the results of a specific course of action that you plan to take within the next 30 minutes.",
  school: 'divination',
  ritual: 1,
  cast_time: '1 minute',
  components: ['V','S','M (specially marked sticks, bones, or other tokens worth at least 25gp)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 19,
)

Spell.create(
  name: 'Aura of Life',
  level: 4,
  description: "Life-preserving energy radiates from you in an aura with a 30-foot radius. Until the spell ends, the aura moves with you, centered on you. Each non-hostile creature in the aura (including you) has resistance to necrotic damage, and its hit point maximum can’t be reduced. In addition, a non-hostile, living creature regains 1 hit point when it starts its turn in the aura with 0 hit points.",
  school: 'abjuration',
  components: ['V'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 20,
)

Spell.create(
  name: 'Aura of Purity',
  level: 4,
  description: "Purifying energy radiates from you in an aura with a 30-foot radius. Until the spell ends, the aura moves with you, centered on you. Each non-hostile creature in the aura (including you) can’t become diseased, has resistance to poison damage, and has advantage on saving throws against effects that cause any of the following conditions: blinded, charmed, deafened, frightened, paralyzed, poisoned, and stunned.",
  school: 'abjuration',
  components: ['V'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 21,
)

Spell.create(
  name: 'Aura of Vitality',
  level: 4,
  description: "Healing energy radiates from you in an aura with a 30-foot radius. Until the spell ends, the aura moves with you, centered on you. You can use a bonus action to cause one creature in the aura (including you) to regain 2d6 hit points.",
  school: 'evocation',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 22,
)

Spell.create(
  name: 'Awaken',
  level: 5,
  description: "After spending the casting time tracing magical pathways within a precious gemstone, you touch a huge or smaller beast or plant. The target must have either no Intelligence score or an Intelligence of 3 or less. The target gains an Intelligence of 10. The target also gains the ability to speak one language you know. If the target is a plant, it gains the ability to move its limbs, roots, vines, creepers, and so forth, and it gains senses similar to a human's. Your DM chooses statistics appropriate for the awakened plant, such as the statistics for the awakened shrub or the awakened tree.

The awakened beast or plant is charmed by you for 30 days or until you and your companions do anything harmful to it. When the charmed condition ends, the awakened creature chooses whether to remain friendly to you, based on how you treated it while it was charmed.",
  school: 'transmutation',
  cast_time: '8 hours',
  range: 'Touch',
  components: ['V','S','M (an agate worth at least 1,000 gp which the spell consumes)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 23,
)

Spell.create(
  name: 'Bane',
  level: 1,
  description: "Up to three creatures of your choice that you can see within range must make Charisma saving throw. Whenever a target that fails this saving throw makes an attack roll or a saving throw before the spell ends, the target must roll a d4 and subtract the number rolled from the attack roll or saving throw.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.",
  school: 'enchantment',
  range: '30 feet',
  components: ['V','S','M (a drop of blood)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 24,
)

Spell.create(
  name: 'Banishing Smite',
  level: 5,
  description: "The next time you hit a creature with a weapon attack before this spell ends, your weapon crackles with force, and the attack deals an extra 5d10 force damage to the target. Additionally, if this attack reduces the target to 50 hit points of fewer, you banish it. If the target is native to a different plane of existence than the on you’re on, the target disappears, returning to its home plane. If the target is native to the plane you’re on, the creature vanishes into a harmless demiplane. While there, the target is incapacitated. It remains there until the spell ends, at which point the target reappears in the space it left or in the nearest unoccupied space if that space is occupied.",
  school: 'abjuration',
  cast_time: '1 bonus action',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 25,
)

Spell.create(
  name: 'Banishment',
  level: 4,
  description: "You attempt to send one creature that you can see within range to another plane of existence. The target must succeed on a Charisma saving throw or be banished.

If the target is native to the plane of existence you're on, you banish the target to a harmless demiplane. While there, the target is incapacitated. The target remains there until the spell ends, at which point the target reappears in the space it left or in the nearest unoccupied space if that space is occupied.

If the target is native to a different plane of existence that the one you're on, the target is banished with a faint popping noise, returning to its home plane. If the spell ends before 1 minute has passed, the target reappears in the space it left or in the nearest unoccupied space if that space is occupied. Otherwise, the target doesn't return.

At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, you can target one additional creature for each slot level above 4th.",
  school: 'abjuration',
  range: '60 feet',
  components: ['V','S','M (an item distasteful to the target)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 26,
)

Spell.create(
  name: 'Barkskin',
  level: 2,
  description: "You touch a willing creature. Until the spell ends, the target's skin has a rough, bark-like appearance, and the target's AC can't be less than 16, regardless of what kind of armor it is wearing.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (a handful of oak bark)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 27,
)

Spell.create(
  name: 'Beacon of Hope',
  level: 3,
  description: "This spell bestows hope and vitality. Choose any number of creatures within range. For the duration, each target has advantage on Wisdom saving throws and death saving throws, and regains the maximum number of hit points possible from any healing.",
  school: 'abjuration',
  range: '30 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 28,
)

Spell.create(
  name: 'Beast Sense',
  level: 3,
  description: "You touch a willing beast. For the duration of the spell, you can use your action to see through the beast’s eyes and hear what it hears, and continue to do so until you use your action to return to your normal senses.",
  school: 'abjuration',
  ritual: 1,
  range: 'Touch',
  components: ['S'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 29,
)

Spell.create(
  name: 'Bestow Curse',
  level: 3,
  description: "You touch a creature, and that creature must succeed on a Wisdom saving throw or become cursed for the duration of the spell. When you cast this spell, choose the nature of the curse from the following options.

• Choose one ability score. While cursed, the target has disadvantage on ability checks and saving throws made with that ability score.

• While cursed, the target has disadvantage on attack rolls against you.

• While cursed, the target must make a Wisdom saving throw at the start of each of its turns. If it fails, it wastes its action that turn doing nothing.

• While the target is cursed, your attacks and spells deal an extra 1d8 necrotic damage to the target.

A remove curse spell ends this effect. At the DM's option, you may choose an alternative curse effect, but it should be no more powerful than those described above. The DM has final say on such a curse's effect.

At Higher Levels: If you cast this spell using a spell slot of 4th level or higher, the duration is concentration, up to 10 minutes. If you use a spell slot of 5th level or higher, the duration is 8 hours. If you use a spell slot of 7th level or higher, the duration is 24 hours. If you use a 9th level spell slot, the spell lasts until it is dispelled. Using a spell slot of 5th level or higher grants a duration that doesn't require concentration.",
  school: 'necromancy',
  range: 'Touch',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 30,
)

Spell.create(
  name: 'Bigby\'s Hand',
  level: 5,
  description: "You create a Large hand of shimmering, translucent force in an unoccupied space that you can see within range. The hand lasts for the spell’s duration, and it moves at your command, mimicking the movements of your own hand.

The hand is an object that has AC 20 and hit points equal to your hit point maximum. If it drops to 0 hit points, the spell ends. It has a Strength of 26 (+8) and a Dexterity of 10 (+0). The hand doesn’t fill its space.

When you cast the spell and as a bonus action on your subsequent turns, you can move the hand up to 60 feet and then cause one of the following effects with it: Forceful Hand, Grasping Hand, Interposing Hand.

At Higher Levels. When you cast this spell using a spell slot of 6th level or higher, the damage from the clenched fist option increases by 2d8 and the damage from the grasping hand increases by 2d6 for each slot level above 5th.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S','M (an eggshell and a snakeskin glove)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 31,
)

Spell.create(
  name: 'Blade Barrier',
  level: 6,
  description: "You create a vertical wall of whirling, razor-sharp blades made of magical energy. The wall appears within range and lasts for the duration. You can make a straight wall up to 100 feet long, 20 feet high, and 5 feet thick, or a ringed wall up to 60 feet in diameter, 20 feet high, and 5 feet thick. The wall provides three-quarters cover to creatures behind it, and its space is difficult terrain.

When a creature enters the wall's area for the first time on a turn or starts its turn there, the creature must make a Dexterity saving throw. On a failed save, the creature takes 6d10 slashing damage. On a successful save, the creature takes half as much damage.",
  school: 'evocation',
  range: '90 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 32,
)

Spell.create(
  name: 'Blade Ward',
  level: 0,
  description: "You extend your hand and trace a sigil of warding in the air. Until the end of your next turn, you have resistance against bludgeoning, piercing, and slashing damage dealt by weapon attacks.",
  school: 'abjuration',
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 33,
)

Spell.create(
  name: 'Bless',
  level: 1,
  description: "You bless up to three creatures of your choice within range. Whenever a target makes an attack roll or a saving throw before the spell ends, the target can roll a d4 and add the number rolled to the attack roll or saving throw.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.",
  school: 'enchantment',
  range: '30 feet',
  components: ['V','S','M (a sprinkling of holy water)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 34,
)

Spell.create(
  name: 'Blight',
  level: 4,
  description: "Necromantic energy washes over a creature of your choice that you can see within range, draining moisture and vitality from it. The target must make a Constitution saving throw. The target takes 8d8 necrotic damage on a failed save, or half as much damage on a successful one. This spell has no effect on undead or constructs.

If you target a plant creature or a magical plant, it makes the saving throw with disadvantage, and the spell deals maximum damage to it.

If you target a nonmagical plant that isn't a creature, such as a tree or shrub, it doesn't make a saving throw, it simply withers and dies.

At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, the damage increases by 1d8 for each slot level above 4th.",
  school: 'necromancy',
  range: '30 feet',
  attack: 'true',
  atk_dmg: {
    1=> '8d8',
  },
  dmg_type: 'Necrotic',
  id: 35,
)

Spell.create(
  name: 'Blinding Smite',
  level: 3,
  description: "The next time you hit a creature with a melee weapon attack during this spell’s duration, you weapon flares with a bright light, and the attack deals an extra 3d8 radiant damage to the target. Additionally, the target must succeed on a Constitution saving throw or be blinded until the spell ends.

A creature blinded by this spell makes another Constitution saving throw at the end of each of its turns. On a successful save, it is no longer blinded.",
  school: 'evocation',
  cast_time: '1 bonus action',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 36,
)

Spell.create(
  name: 'Blindness/Deafness',
  level: 2,
  description: "You can blind or deafen a foe. Choose one creature that you can see within range to make a Constitution saving throw. If it fails, the target is either blinded or deafened (your choice) for the duration. At the end of each of its turns, the target can make a Constitution saving throw. On a success, the spell ends.

At Higher Levels. When you cast this spell using a spell slot of 3rd level or higher, you can target one additional creature for each slot level above 2nd.",
  school: 'necromancy',
  range: '30 feet',
  components: ['V'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 37,
)

Spell.create(
  name: 'Blink',
  level: 3,
  description: "Roll a d20 at the end of each of your turns for the duration of the spell. On a roll of 11 or higher, you vanish from your current plane of existence and appear in the Ethereal Plane (the spell fails and the casting is wasted if you were already on that plane). At the start of you next turn, and when the spell ends if you are on the Ethereal Plane, you return to an unoccupied space of your choice that you can see within 10 feet of the space you vanished from. If no unoccupied space is available within that range, you appear in the nearest unoccupied space (chosen at random if more than one space is equally near). You can dismiss this spell as an action.

While on the Ethereal Plane, you can see and hear the plane you originated from, which is cast in shades of gray, and you can't see anything more than 60 feet away. You can only affect and be affected by other creatures on the Ethereal Plane. Creature that aren't there can't perceive you or interact with you, unless they have the ability to do so.",
  school: 'transmutation',
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 38,
)

Spell.create(
  name: 'Blur',
  level: 2,
  description: "Your body becomes blurred, shifting and wavering to all who can see you. For the duration, any creature has disadvantage on attack rolls against you. An attacker is immune to this effect if it doesn’t rely on sight, as with blindsight, or can see through illusions, as with truesight.",
  school: 'illusion',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 39,
)

Spell.create(
  name: 'Branding Smite',
  level: 2,
  description: "The next time you hit a creature with a weapon attack before this spell ends, the weapon gleams with astral radiance as you strike. The attack deals an extra 2d6 radiant damage to the target, which becomes visible if it's invisible, and the target sheds dim light in a 5-foot radius and can't become invisible until the spell ends.

At Higher Levels. When you cast this spell using a spell slot of 3rd level or higher, the extra damage increases by 1d6 for each slot level above 2nd.",
  school: 'evocation',
  cast_time: '1 bonus action',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 40,
)

Spell.create(
  name: 'Burning Hands',
  level: 1,
  description: "As you hold your hands with thumbs touching and fingers spread, a thin sheet of flames shoots forth from your outstretched fingertips. Each creature in a 15-foot cone must make a Dexterity saving throw. A creature takes 3d6 fire damage on a failed save, or half as much damage on a successful one.

The fire ignites any flammable objects in the area that aren't being worn or carried.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.",
  school: 'evocation',
  range: 'Self (15-foot cone)',
  attack: 'true',
  atk_dmg: {
    1=> '3d6',
  },
  dmg_type: 'Fire',
  id: 41,
)

Spell.create(
  name: 'Call Lightning',
  level: 3,
  description: "A storm cloud appears in the shape of a cylinder that is 10 feet tall with a 60-foot radius, centered on a point you can see 100 feet directly above you. The spell fails if you can't see a point in the air where the storm cloud could appear (for example, if you are in a room that can't accommodate the cloud).

When you cast the spell, choose a point you can see within range. A bolt of lightning flashes down from the cloud to that point. Each creature within 5 feet of that point must make a Dexterity saving throw. A creature takes 3d10 lightning damage  on a failed save, or half as much damage on a successful one. On each of your turns until the spell ends, you can use your action to call down lightning in this way again, targeting the same point or a different one.

If you are outdoors in stormy conditions when you cast this spell, the spell gives you control over the existing storm instead of creating a new one. Under such conditions, the spell's damage increases by 1d10.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher level, the damage increases by 1d10 for each slot level above 3rd.",
  school: 'conjuration',
  range: '120 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'true',
  atk_dmg: {
    1=> '3d10',
  },
  dmg_type: 'Lightning',
  id: 42,
)

Spell.create(
  name: 'Calm Emotions',
  level: 2,
  description: "You attempt to suppress strong emotions in a group of people. Each humanoid in a 20-foot-radius sphere centered on a point you choose within range must make a Charisma saving throw; a creature can choose to fail this saving throw if it wishes. If a creature fails its saving throw, choose one of the following two effects.

You can suppress any effect causing a target to be charmed or frightened. When this spell ends, any suppressed effect resumes, provided that its duration has not expired in the meantime.

Alternatively, you can make a target indifferent about creatures of your choice that it is hostile toward. This indifference ends if the target is attacked or harmed by a spell or if it witnesses any of its friends being harmed. When the spell ends, the creature becomes hostile again, unless the DM rules otherwise.",
  school: 'enchantment',
  range: '60 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 43,
)

Spell.create(
  name: 'Chain Lightning',
  level: 6,
  description: "You create a bolt of lightning that arcs toward a target of your choice that you can see within range. Three bolts then leap from that target to as many as three other targets, each of which must be within 30 feet of the first target. A target can be a creature or an object and can be targeted by only one of the bolts.

A target must make a Dexterity saving throw. The target takes 10d8 lightning damage on a failed save, or half as much on a successful one.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, one additional bolt leaps from the first target to another target for each slot level above 6th.",
  school: 'evocation',
  range: '150 feet',
  components: ['V','S','M (a bit of fur, a piece of amber, a crystal rod, and three silver pins))'],
  attack: 'true',
  atk_dmg: {
    1=> '10d8',
  },
  dmg_type: 'Lightning',
  id: 44,
)

Spell.create(
  name: 'Charm Person',
  level: 1,
  description: "You attempt to charm a humanoid you can see within range. It must make a Wisdom saving throw, and does so with advantage if you or your companions are fighting it. If it fails the saving throw, it is charmed by you until the spell ends or until you or your companions do anything harmful to it. The charmed creature regards you as a friendly acquaintance. When the spell ends, the creature knows it was charmed by you.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st. The creatures must be within 30 feet of each other when you target them.",
  school: 'enchantment',
  range: '30 feet',
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 45,
)

Spell.create(
  name: 'Chill Touch',
  level: 0,
  description: "You create a ghostly, skeletal hand in the space of a creature within range. Make a ranged spell attack against the creature to assail it with the chill of the grave. On a hit, the target takes 1d8 necrotic damage, and it can't regain hit points until the start of your next turn. Until then, the hand clings to the target.

If you hit an undead target, it also has disadvantage on attack rolls against you until the end of your next turn.

This spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  school: 'necromancy',
  range: '120 feet',
  duration: '1 round',
  attack: 'true',
  atk_dmg: {
    1=> '1d8',
    5=> '2d8',
    11=> '3d8',
    17=> '4d8',
  },
  dmg_type: 'Necrotic',
  id: 46,
)

Spell.create(
  name: 'Chromatic Orb',
  level: 1,
  description: "You hurl a 4-inch-diameter sphere of energy at a creature that you can see within range. You choose acid, cold, fire, lightning, poison, or thunder for the type of orb you create, and then make a ranged spell attack against the target. If the attack hits, the creature takes 3d8 damage of the type you chose.

At Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d8 for each slot level above 1st.",
  school: 'evocation',
  range: '90 feet',
  components: ['V','S','M (a diamond worth at least 50 gp)'],
  attack: 'true',
  atk_dmg: {
    1=> '3d8',
  },
  dmg_type: 'Elemental',
  id: 47,
)

Spell.create(
  name: 'Circle of Death',
  level: 6,
  description: "A sphere of negative energy ripples out in a 60-foot-radius sphere from a point within range. Each creature in that area must make a Constitution saving throw. A target takes 8d6 necrotic damage on a failed save, or half as much damage on a successful one.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, the damage increases by 2d6 for each slot level above 6th.",
  school: 'necromancy',
  range: '150 feet',
  components: ['V','S','M (the powder of a crushed black pearl worth at least 500 gp)'],
  attack: 'true',
  atk_dmg: {
    1=> '8d6',
  },
  dmg_type: 'Necrotic',
  id: 48,
)

Spell.create(
  name: 'Circle of Power',
  level: 5,
  description: "Divine energy radiates from you, distorting and diffusing magical energy within 30 feet of you. Until the spell ends, the sphere moves with you, centered on you. For the duration, each friendly creature in the area (including you) has advantage on saving throws against spells and other magical effects.

Additionally, when an affected creature succeeds on a saving throw made against a spell or magical effect that allows it to make a saving throw to take only half damage, it instead takes no damage if it succeeds on the saving throws.",
  school: 'abjuration',
  range: 'Self (30-foot radius)',
  components: ['V'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 49,
)

Spell.create(
  name: 'Clairvoyance',
  level: 3,
  description: "You create an invisible sensor within range in a location familiar to you (a place you have visited or seen before) or in an obvious location that is unfamiliar to you (such as behind a door, around a corner, or in a grove of trees). The sensor remains in place for the duration, and it can't be attacked or otherwise interacted with.

When you cast the spell, you choose seeing or hearing. You can use the chosen sense through the sensor as if you were in its space. As your action, you can switch between seeing and hearing.

A creature that can see the sensor (such as a creature benefitting from see invisibility or truesight) sees a luminous, intangible orb about the size of your fist.",
  school: 'divination',
  cast_time: '10 minutes',
  range: '1 mile',
  components: ['V','S','M (a focus worth at least 100 gp, either a jeweled horn for hearing or a glass eye for seeing)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 50,
)

Spell.create(
  name: 'Clone',
  level: 8,
  description: "This spell grows an inert duplicate of a living creature as a safeguard against death. This clone forms inside a sealed vessel and grows to full size and maturity after 120 days; you can also choose to have the clone be a younger version of the same creature. It remains inert and endures indefinitely, as long as its vessel remains undisturbed.
At any time after the clone matures, if the original creature dies, its soul transfers to the clone, provided that the soul is free and willing to return. The clone is physically identical to the original and has the same personality, memories, and abilities, but none of the original’s equipment. The original creature’s physical remains, if they still exist, become inert and can’t thereafter be restored to life, since the creature’s soul is elsewhere.",
  school: 'necromancy',
  cast_time: '1 hour',
  range: 'Touch',
  components: ['V','S','M (A diamond worth at least 1,000 gp and at least 1 cubic inch of flesh of the creature that is to be cloned, which the spell consumes, and a vessel worth at least 2,000 gp that has a sealable lid and is large enough to hold a Medium creature, such as a huge urn, coffin, mud-filled cyst in the ground, or crystal container filled with salt water)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 51,
)

Spell.create(
  name: 'Cloud of Daggers',
  level: 2,
  description: "You fill the air with spinning daggers in a cube 5 feet on each side, centered on a point you choose within range. A creature takes 4d4 slashing damage when it enters the spell’s area for the first time on a turn or starts its turn there.

At Higher Levels. When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 2d4 for each slot level above 2nd.",
  school: 'conjuration',
  range: '60 feet',
  components: ['V','S','M (a sliver of glass)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 52,
)

Spell.create(
  name: 'Cloudkill',
  level: 5,
  description: "You create a 20-foot-radius sphere of poisonous, yellow-green fog centered on a point you choose within range. The fog spreads around corners. It lasts for the duration or until strong wind disperses the fog, ending the spell. Its area is heavily obscured.

When a creature enters the spell's area for the first time on a turn or starts its turn there, that creature must make a Constitution saving throw. The creature takes 5d8 poison damage on a failed save, or half as much damage on a successful one. Creatures are affected even if they hold their breath or don't need to breathe.

The fog moves 10 feet away from you at the start of each of your turns, rolling along the surface of the ground. The vapors, being heavier than air, sink to the lowest level of the land, even pouring down openings.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the damage increases by 1d8 for each slot level above 5th.",
  school: 'conjuration',
  range: '120 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 53,
)

Spell.create(
  name: 'Color Spray',
  level: 1,
  description: "A dazzling array of flashing, colored light springs from your hand. Roll 6d10, the total is how many hit points of creatures this spell can effect. Creatures in a 15-foot cone originating from you are affected in ascending order of their current hit points (ignoring unconscious creatures and creatures that can't see).

Starting with the creature that has the lowest current hit points, each creature affected by this spell is blinded until the spell ends. Subtract each creature's hit points from the total before moving on to the creature with the next lowest hit points. A creature's hit points must be equal to or less than the remaining total for the creature to be affected.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, roll an additional 2d10 for each slot level above 1st.",
  school: 'illusion',
  range: 'Self (15-foot cone)',
  components: ['V','S','M (a pinch of powder or sand that is colored red, yellow, and blue)'],
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 54,
)

Spell.create(
  name: 'Command',
  level: 1,
  description: "You speak a one-word command to a creature you can see within range. The target must succeed on a Wisdom saving throw or follow the command on its next turn. The spell has no effect if the target is undead, if it doesn't understand your language, or if your command is directly harmful to it.

  At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can affect one additional creature for each slot level above 1st. The creatures must be within 30 feet of each other when you target them.",
  school: 'enchantment',
  range: '60 feet',
  components: ['V'],
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 55,
)

Spell.create(
  name: 'Commune',
  level: 5,
  description: "You contact your deity or a divine proxy and ask up to three questions that can be answered with a yes or no. You must ask your questions before the spell ends. You receive a correct answer for each question.

Divine beings aren't necessarily omniscient, so you might receive 'unclear' as an answer if a question pertains to information that lies beyond the deity's knowledge. In a case where a one-word answer could be misleading or contrary to the deity's interests, the DM might offer a short phrase as an answer instead.",
  school: 'divination',
  ritual: 1,
  cast_time: '1 minute',
  components: ['V','S','M (incense and a vial of holy or unholy water)'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 56,
)

Spell.create(
  name: 'Commune with Nature',
  level: 5,
  description: "You briefly become one with nature and gain knowledge of the surrounding territory. In the outdoors, the spell gives you knowledge of the land within 3 miles of you. In caves and other natural underground settings, the radius is limited to 300 feet. The spell doesn't function where nature has been replaced by construction, such as in dungeons and towns.

You instantly gain knowledge of up to three facts of your choice about any of the following subjects as they relate to the area - terrain and bodies of water; prevalent plants, minerals, animals, or peoples; powerful celestials, fey, fiends, elementals, or undead; influence from other planes of existence; buildings.",
  school: 'divination',
  cast_time: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 57,
)

Spell.create(
  name: 'Compelled Duel',
  level: 1,
  description: "You attempt to compel a creature into a duel. One creature that you can see within range must make a Wisdom saving throw. On a failed save, the creature is drawn to you, compelled by your divine demand. For the duration, it has disadvantage on attack rolls against creatures other than you, and must make a Wisdom saving throw each time it attempts to move to a space that is more than 30 feet away from you; if it succeeds on this saving throw, this spell doesn’t restrict the target’s movement for that turn.

The spell ends if you attack any other creature, if you cast a spell that targets a hostile creature other than the target, if a creature friendly to you damages the target or casts a harmful spell on it, or if you end your turn more than 30 feet away from the target.",
  school: 'enchantment',
  cast_time: '1 bonus action',
  range: '30 feet',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 58,
)

Spell.create(
  name: 'Comprehend Languages',
  level: 1,
  description: "For the duration, you understand the literal meaning of any spoken language that you hear. You also understand any written language that you see, but you must be touching the surface on which the words are written. It takes about 1 minute to read one page of text.

This spell doesn’t decode secret messages in a text or a glyph, such as an arcane sigil, that isn’t part of a written language.",
  school: 'divination',
  ritual: 1,
  components: ['V','S','M (a pinch of salt)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 59,
)

Spell.create(
  name: 'Compulsion',
  level: 4,
  description: "Creatures of your choice that you can see within range and that can hear you must make a Wisdom saving throw. A target automatically succeeds on this saving throw if it can't be charmed. On a failed save, a target is affected by this spell. Until the spell ends, you can use a bonus action on each of your turns to designate a direction that is horizontal to you. Each affected target must use as much of its movement as possible to move in that direction on its next turn. It can take its action before it moves. After moving in this way, it can make another Wisdom saving to try to end the effect. A target isn't compelled to move into an obviously deadly hazard, such as a fire or pit, but it will provoke opportunity attacks to move in the designated direction.",
  school: 'enchantment',
  range: '30 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 60,
)

Spell.create(
  name: 'Cone of Cold',
  level: 5,
  description: "A blast of cold air erupts from your hands. Each creature in a 60-foot cone must make a Constitution saving throw. A creature takes 8d8 cold damage on a failed save, or half as much damage on a successful one.

A creature killed by this spell becomes a frozen statue until it thaws.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the damage increases by 1d8 for each slot level above 5th.",
  school: 'evocation',
  range: 'Self (60-foot cone)',
  components: ['V','S','M (a small crystal or glass cone)'],
  attack: 'true',
  atk_dmg: {
    1=> '8d8',
  },
  dmg_type: 'Cold',
  id: 61,
)

Spell.create(
  name: 'Confusion',
  level: 4,
  description: "This spell assaults and twists creatures' minds, spawning delusions and provoking uncontrolled actions. Each creature in a 10-foot-radius sphere centered on a point you choose within range must succeed on a Wisdom saving throw when you cast this spell or be affected by it.

An affected target can't take reactions and must roll a d10 at the start of each of its turns to determine its behavior for that turn.

1: The creature uses all its movement to move in a random direction. To determine the direction, roll a d8 and assign a direction to each die face. The creature doesn't take an action this turn.

2-6: The creature doesn't move or take actions this turn.

7-8: The creature uses its action to make a melee attack against a randomly determined creature within its reach. If there is no creature within its reach, the creature does nothing this turn.

9-10: The creature can act and move normally.

At the end of its turns, an affected target can make a Wisdom saving throw. If it succeeds, this effect ends for that target.

At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, the radius of the sphere increases by 5 feet for each slot above 4th.",
  school: 'enchantment',
  range: '90 feet',
  components: ['V','S','M (three nut shells)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 62,
)

Spell.create(
  name: 'Conjure Animals',
  level: 3,
  description: "You summon fey spirits that take the form of beasts and appear in unoccupied spaces that you can see within range. Choose one of the following options for what appears.

• One beast of challenge rating 2 or lower

• Two beasts of challenge rating 1 or lower

• Four beasts of challenge rating 1/2 or lower

• Eight beasts of challenge rating 1/4 or lower

Each beast is also considered fey, and it disappears when it drops to 0 hit points or when the spell ends.

The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as a group, which has its own turns. They obey any verbal commands that you issue to them (no action required by you). If you don't issue any commands to them, they defend themselves from hostile creatures, but otherwise take no actions. The DM has the creatures' statistics.

At Higher Levels: When you cast this spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear - twice as many with a 5th-level slot, three times as many with a 7th-level slot, and four times as many with a 9th-level slot.",
  school: 'conjuration',
  range: '60 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 63,
)

Spell.create(
  name: 'Conjure Barrage',
  level: 3,
  description: "You throw a nonmagical weapon or fire a piece of nonmagical ammunition into the air to create a cone of identical weapons that shoot forward and then disappear. Each creature in a 60-foot cone must succeed on a Dexterity saving throw. A creature takes 3d8 damage on a failed save, or half as much damage on a successful one. The damage type is the same as that of the weapon or ammunition used as a component.",
  school: 'conjuration',
  range: 'Self (60-foot cone)',
  components: ['V','S','M (one piece of ammunition or a thrown weapon)'],
  attack: 'true',
  atk_dmg: {
    1=> '3d8',
  },
  dmg_type: 'Spell',
  id: 64,
)

Spell.create(
  name: 'Conjure Celestial',
  level: 7,
  description: "You summon a celestial of challenge rating 4 or lower, which appears in an unoccupied space that you can see within range. The celestial disappears when it drops to 0 hit points or when the spell ends.

The celestial is friendly to you and your companions for the duration. Roll initiative for the celestial, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you), as long as they don't violate its alignment. If you don't issue any commands to the celestial, it defends itself from hostile creatures but otherwise takes no actions The DM has the celestial's statistics.

At Higher Levels: When you cast this spell using a 9th-level spell slot, you summon a celestial of challenge rating 5 or lower.",
  school: 'conjuration',
  cast_time: '1 minute',
  range: '90 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 65,
)

Spell.create(
  name: 'Conjure Elemental',
  level: 5,
  description: "You call forth an elemental servant. Choose an area of air, earth, fire, or water that fills a 10-foot cube within range. An elemental of challenge rating 5 or lower appropriate to the area you chose appears in an unoccupied space within 10 feet of it. For example, a fire elemental emerges from a bonfire, and an earth elemental rises up from the ground. The elemental disappears when it drops to 0 hit points or when the spell ends.

The elemental is friendly to you and your companions for the duration. Roll initiative for the elemental, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you). If you don't issue any commands to the elemental, it defends itself from hostile creatures but otherwise takes no actions.

If your concentration is broken, the elemental doesn't disappear. Instead, you lose control of the elemental, it becomes hostile toward you and your companions, and it might attack. An uncontrolled elemental can't be dismissed by you, and it disappears 1 hour after you summoned it. The DM has the elemental's statistics.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the challenge rating increases by 1 for each slot level above 5th.",
  school: 'conjuration',
  cast_time: '1 minute',
  range: '90 feet',
  components: ['V','S','M (burning incense for air, soft clay for earth, sulfure and phosphorus for fire, or water and sand for water)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 66,
)

Spell.create(
  name: 'Conjure Fey',
  level: 6,
  description: "You summon a fey creature of challenge rating 6 or lower, or a fey spirit that takes the form of a beast of challenge rating 6 or lower. It appears in an unoccupied space that you can see within range. The fey creature disappears when it drops to 0 hit points or when the spell ends.

The fey creature is friendly to you and your companions for the duration. Roll initiative for the creature, which has its own turns. It obeys any verbal commands that you issue to it (no action required by you), as long as they don't violate its alignment. If you don't issue any commands to the fey creature, it defends itself from hostile creatures but otherwise takes no actions.

If your concentration is broken, the fey creature doesn't disappear. Instead, you lose control of the fey creature, it becomes hostile toward you and your companions, and it might attack. An uncontrolled fey creature can't be dismissed by you, and it disappears 1 hour after you summoned it. The DM has the fey creature's statistics.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, the challenge rating increases by 1 for each slot level above 6th.",
  school: 'conjuration',
  range: '90 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 67,
)

Spell.create(
  name: 'Conjure Minor Elementals',
  level: 4,
  description: "You summon elementals that appear in unoccupied spaces that you can see within range. You choose one the following options for what appears.

• One elemental of challenge rating 2 or lower

• Two elementals of challenge rating 1 or lower

• Four elementals of challenge rating 1/2 or lower

• Eight elementals of challenge rating 1/4 or lower.

An elemental summoned by this spell disappears when it drops to 0 hit points or when the spell ends.

The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as a group, which has its own turns. They obey any verbal commands that you issue to them (no action required by you). If you don't issue any commands to them, they defend themselves from hostile creatures, but otherwise take no actions. The DM has the creatures' statistics.

At Higher Levels: When you cast this spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear - twice as many with a 6th-level slot and three times as many with an 8th-level slot",
  school: 'conjuration',
  cast_time: '1 minute',
  range: '90 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 68,
)

Spell.create(
  name: 'Conjure Volley',
  level: 5,
  description: "You fire a piece of nonmagical ammunition from a ranged weapon or throw a nonmagical weapon into the air and choose a point within range. Hundreds of duplicates of the ammunition or weapon fall in a volley from above and then disappear. Each creature in a 40-foot-radius, 20-foot-high cylinder centered on that point must make a Dexterity saving throw. A creature takes 8d8 damage on a failed save, or half as much damage on a successful one. The damage type is the same as that of the ammunition or weapon.",
  school: 'conjuration',
  range: '150 feet',
  components: ['V','S','M (one piece of ammunition or one thrown weapon)'],
  attack: 'true',
  atk_dmg: {
    1=> '8d8',
  },
  dmg_type: 'Weapon',
  id: 69,
)

Spell.create(
  name: 'Conjure Woodland Beings',
  level: 4,
  description: "You summon fey creatures that appear in unoccupied spaces that you can see within range. Choose one of the following options for what appears.

• One fey creature of challenge rating 2 or lower

• Two fey creatures of challenge rating 1 or lower

• Four fey creatures of challenge rating 1/2 or lower

• Eight fey creatures of challenge rating 1/4 or lower

A summoned creature disappears when it drops to 0 hit points or when the spell ends. The summoned creatures are friendly to you and your companions. Roll initiative for the summoned creatures as a group, which have their own turns. They obey any verbal commands that you issue to them (no action required by you). If you don't issue any commands to them, they defend themselves from hostile creatures, but otherwise take no actions. The DM has the creatures' statistics.

At Higher Levels: When you cast this spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear - twice as many with a 6th-level slot and three times as many with an 8th-level slot.",
  school: 'conjuration',
  range: '60 feet',
  components: ['V','S','M (one holly berry per creature summoned)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 70,
)

Spell.create(
  name: 'Contact Other Plane',
  level: 5,
  description: "You mentally contact a demigod, the spirit of a long-dead sage, or some other mysterious entity from another plane. Contacting this extraplanar intelligence can strain or even break your mind. When you cast this spell, make a DC 15 Intelligence saving throw. On a failure, you take 6d6 psychic damage and are insane until you finish a long rest. While insane, you can't take actions, can't understand what other creatures say, can't read, and speak only in gibberish. A greater restoration spell cast on you ends this effect.

On a successful save, you can ask the entity up to five questions. You must ask your questions before the spell ends. The DM answers each question with one word, such as yes, no, maybe, never, irrelevant, unclear (if the entity doesn't know the answer to the question). If a one-word answer would be misleading, the DM might instead offer a short phrase as an answer.",
  school: 'divination',
  ritual: 1,
  cast_time: '1 minute',
  components: ['V'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 71,
)

Spell.create(
  name: 'Contagion',
  level: 5,
  description: "Your touch inflicts disease. Make a melee spell attack against a creature within your reach. On a hit, you afflict the creature with a disease of your choice from any of the ones described below.

At the end of each of the target's turns, it must make a Constitution saving throw. After failing three of these saving throws, the disease's effects last for the duration, and the creature stops making these saves. After succeeding on three of these saving throws, the creature recovers from the disease, and the spell ends.

Since this spell induces a natural disease in its target, any effect that removes a disease or otherwise ameliorates a disease's effects apply to it.

Blinding Sickness: Pain grips the creature's mind, and its eyes turn milky white. The creature has disadvantage on Wisdom checks and Wisdom saving throws and is blinded.

Filth Fever: A raging fever sweeps through the creature's body. The creature has disadvantage on Strength checks, Strength saving throws, and attack rolls that use Strength.

Flesh Rot: The creature's flesh decays. The creature has disadvantage on Charisma checks and vulnerability to all damage.

Mindfire: The creature's mind becomes feverish. The creature has disadvantage on Intelligence checks and Intelligence saving throws, and the creature behaves as if under the effects of the confusion spell during combat.

Seizure: The creature is overcome with shaking. The creature has disadvantage on Dexterity checks, Dexterity saving throws, and attack rolls that use Dexterity.

Slimy Doom: The creature begins to bleed uncontrollably. The creature has disadvantage on Constitution checks and Constitution saving throws. In addition, whenever the creature takes damage, it is stunned until the end of its next turn.",
  school: 'necromancy',
  range: 'Touch',
  duration: '7 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 72,
)

Spell.create(
  name: 'Contingency',
  level: 6,
  description: "Choose a spell of or lower that you can cast, that has a casting time of 1 action, and that can target you. You cast that spell, called the contingent spell, as part of casting contingency, expending spell slots for both, but the contingent spell doesn't come into effect. Instead, it takes effect when a certain circumstance occurs. You describe that circumstance when you cast the two spells. For example, a contingency cast with water breathing might stipulate that water breathing comes into effect when you are engulfed in water or a similar liquid.

The contingent spell takes effect immediately after the circumstance is met for the first time, whether or not you want it to, and then contingency ends.

The contingent spell takes effect only on you, even if it can normally target others. You can use only one contingency spell at a time. If you cast this spell again, the effect of another contingency spell on you ends. Also, contingency ends on you if its material component is ever not on your person.",
  school: 'evocation',
  cast_time: '10 minutes',
  components: ['V','S','M (a statuette of youreslf carved from ivory and dcorated with gems worth at least 1,500 gp)'],
  duration: '10 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 73,
)

Spell.create(
  name: 'Continual Flame',
  level: 2,
  description: "A flame, equivalent in brightness to a torch, springs forth from an object that you touch. The effect looks like a regular flame, but it creates no heat and doesn't use oxygen. A continual flame can be covered or hidden but not smothered or quenched.",
  school: 'evocation',
  range: 'Touch',
  components: ['V','S','M (ruby dust worth 50 gp, which the spell consumes)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 74,
)

Spell.create(
  name: 'Control Water',
  level: 4,
  description: "Until the spell ends, you control any freestanding water inside an area you choose that is a cube up to 100 feet on a side. You can choose from any of the following effects when you cast this spell. As an action on your turn, you can repeat the same effect or choose a different one. Flood, Part Water, Redirect Flow, Whirpool.",
  school: 'transmutation',
  range: '300 feet',
  components: ['V','S','M (a drop of water and a pinch of dust)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 75,
)

Spell.create(
  name: 'Control Weather',
  level: 8,
  description: "You take control of the weather within 5 miles of you for the duration. You must be outdoors to cast this spell. Moving to a place where you don't have a clear path to the sky ends the spell early.

When you cast the spell, you change the current weather conditions, which are determined by the DM based on the climate and season. You can change precipitation, temperature, and wind. It takes 1d4 x 10 minutes for the new conditions to take effect. Once they do so, you can change the conditions again. When the spell ends, the weather gradually returns to normal.",
  school: 'transmutation',
  cast_time: '10 minutes',
  range: 'Self (5-mile radius)',
  components: ['V','S','M (burning incense and bits of earth and wood mixed in water)'],
  duration: 'Concentration, up to 8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 76,
)

Spell.create(
  name: 'Cordon of Arrows',
  level: 2,
  description: "You plant four pieces of nonmagical ammunition – arrows or crossbow bolts – in the ground within range and lay magic upon them to protect an area. Until the spell ends, whenever a creature other than you comes within 30 feet of the ammunition for the first time on a turn or ends its turn there, one piece of ammunition flies up to strike it. The creature must succeed on a Dexterity saving throw or take 1d6 piercing damage. The piece of ammunition is then destroyed. The spell ends when no ammunition remains.

When you cast this spell, you can designate any creatures you choose, and the spell ignores them.

At Higher Levels. When you cast this spell using a spell slot of 3rd level or higher, the amount of ammunition that can be affected increases by two for each slot level above 2nd.",
  school: 'transmutation',
  range: '5 feet',
  components: ['V','S','M (four or more arrows or bolts)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 77,
)

Spell.create(
  name: 'Counterspell',
  level: 3,
  description: "You attempt to interrupt a creature in the process of casting a spell. If the creature is casting a spell of 3rd level or lower, its spell fails and has no effect. If it is casting a spell of 4th level or higher, make an ability check using your spellcasting ability. The DC equals 10 + the spell's level. On a success, the creature's spell fails and has no effect.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the interrupted spell has no effect if its level is less than or equal to the level of the spell slot you used.",
  school: 'abjuration',
  cast_time: '1 reaction',
  range: '60 feet',
  components: ['S'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 78,
)

Spell.create(
  name: 'Create Food and Water',
  level: 3,
  description: "You create 45 pounds of food and 30 gallons of water on the ground or in containers within range, enough to sustain up to fifteen humanoids or five steeds for 24 hours. The food is bland but nourishing, and spoils if uneaten after 24 hours. The water is clean and doesn't go bad.",
  school: 'conjuration',
  range: '30 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 79,
)

Spell.create(
  name: 'Create or Destroy Water',
  level: 1,
  description: "You either create or destroy water.

Create Water: You create up to 10 gallons of clean water within range in an open container. Alternatively, the water falls as rain in a 30-foot cube within range, extinguishing exposed flames in the area.

Destroy Water: You destroy up to 10 gallons of water in an open container within range. Alternatively, you destroy fog in a 30-foot cube within range.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you create or destroy 10 additional gallons of water, or the size of the cube increases by 5 feet, for each slot level above 1st.",
  school: 'transmutation',
  range: '30 feet',
  components: ['V','S','M (a drop of water if creating water or a few grains of sand if destroying it)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 80
)

Spell.create(
  name: 'Create Undead',
  level: 6,
  description: "You can cast this spell only at night. Choose up to three corpses of Medium or Small humanoids within range. Each corpse becomes a ghoul under your control. (The DM has game statistics for these creatures.)

As a bonus action on each of your turns, you can mentally command any creature you animated with this spell if the creature is within 120 feet of you (if you control multiple creatures, you can command any or all of them at the same time, issuing the same command to each one). You decide what action the creature will take and where it will move during its next turn, or you can issue a general command, such as to guard a particular chamber or corridor. If you issue no commands, the creature only defends itself against hostile creatures. Once given an order, the creature continues to follow it until its task is complete.

The creature is under your control for 24 hours, after which it stops obeying any command you have given it. To maintain control of the creature for another 24 hours, you must cast this spell on the creature before the current 24-hour period ends. This use of the spell reasserts your control over up to three creatures you have animated with this spell, rather than animating new ones.

At Higher Levels: When you cast this spell using a 7th-level spell slot, you can animate or reassert control over four ghouls. When you cast this spell using an 8th-level spell slot, you can animate or reassert control over five ghouls or two ghasts or wights. When you cast this spell using a 9th-level spell slot, you can animate or reassert control over six ghouls, three ghasts or wights, or two mummies.",
  school: 'necromancy',
  range: '10 feet',
  components: ['V','S','M (one clay pot filled with grave dirt, one clay pot filled with brackish water, and one 150 gp black onyx stone for each corpse)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 81,
)

Spell.create(
  name: 'Creation',
  level: 5,
  description: "You pull wisps of shadow material from the Shadowfell to create a nonliving object of vegetable matter within range - soft goods, rope, wood, or something similar. You can also use this spell to create mineral objects such as stone, crystal, or metal. The object created must be no larger than a 5-foot cube, and the object must be of a form and material that you have seen before.

The duration depends on the object's material. If the object is composed of multiple materials, use the shortest duration.

Material - Duration:
Vegetable matter - 1 day
Stone/crystal - 12 hours
Precious metals - 1 hour
Gems - 10 minutes
Adamantine/Mithral - 1 minute

Using any material created by this spell as another spell's material component causes that spell to fail.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the cube increases by 5 feet for each slot level above 5th.",
  school: 'illusion',
  cast_time: '1 minute',
  range: '30 feet',
  components: ['V','S','M (a tiny piece of matter of the same type of the item you plan to create)'],
  duration: 'Special',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 82,
)

Spell.create(
  name: 'Crown of Madness',
  level: 2,
  description: "One humanoid of your choice that you can see within range must succeed on a Wisdom saving throw or become charmed by you for the duration. While the target is charmed in this way, a twisted crown of jagged iron appears on its head, and a madness glows in its eyes.

The charmed target must use its action before moving on each of its turns to make a melee attack against a creature other than itself that you mentally choose. The target can act normally on its turn if you choose no creature or if none are within its reach.

On your subsequent turns, you must use your action to maintain control over the target, or the spell ends. Also, the target can make a Wisdom saving throw at the end of each of its turns. On a success, the spell ends.",
  school: 'enchantment',
  range: '120 feet',
  duration: 'Concentration, 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 83,
)

Spell.create(
  name: "Crusader's Mantle",
  level: 3,
  description: "Holy power radiates from you in an aura with a 30-foot radius, awakening boldness in friendly creatures. Until the spell ends, the aura moves with you, centered on you. While in the aura, each non-hostile creature in the aura (including you) deals an extra 1d4 radiant damage when it hits with a weapon attack.",
  school: 'evocation',\
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 84,
)

Spell.create(
  name: 'Cure Wounds',
  level: 1,
  description: "A creature you touch regains a number of hit points equal to 1d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the healing increases by 1d8 for each slot level above 1st.",
  school: 'evocation',
  range: 'Touch',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 85
)

Spell.create(
  name: 'Dancing Lights',
  level: 0,
  description: "You create up to four torch-sized lights within range, making them appear as torches, lanterns, or glowing orbs that hover in the air for the duration. You can also combine the four lights into one glowing vaguely humanoid form of Medium size. Whichever form you choose, each light sheds dim light in a 10-foot radius.

As a bonus action on your turn, you can move the lights up to 60 feet to a new spot within range. A light must be within 20 feet of another light created by this spell, and a light winks out if it exceeds the spell's range.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S','M (a bit of phosphorus or wychwood, or a glowworm)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 86,
)

Spell.create(
  name: 'Darkness',
  level: 2,
  description: "Magical darkness spreads from a point you choose within range to fill a 15-foot radius sphere for the duration. The darkness spreads around corners. A creature with darkvision can't see through this darkness, and nonmagical light can't illuminate it.

If the point you choose is on an object you are holding or one that isn't being worn or carried, the darkness emanates from the object and moves with it. Completely covering the source of the darkness with an opaque object, such as a bowl or a helm, blocks the darkness.

If any of this spell's area overlaps with an area of light created by a spell of 2nd level or lower, the spell that created the light is dispelled.",
  school: 'evocation',
  range: '60 feet',
  components: ['V','M (bat fur and a drop of pitch or piece of coal)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 87,
)

Spell.create(
  name: 'Darkvision',
  level: 2,
  description: "You touch a willing creature to grant it the ability to see in the dark. For the duration, that creature has darkvision out to a range of 60 feet.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (either a pinch of dried carrot or an agate)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 88,
)

Spell.create(
  name: 'Death Ward',
  level: 4,
  description: "You touch a creature and grant it a measure of protection from death. The first time the target would drop to 0 hit points as a result of taking damage, the target instead drops to 1 hit point, and the spell ends. If the spell is still in effect when the target is subjected to an effect that would kill it instantaneously without dealing damage, that effect is instead negated against the target, and the spells ends.",
  school: 'abjuration',
  range: 'Touch',
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 89,
)

Spell.create(
  name: 'Delayed Blast Fireball',
  level: 7,
  description: "A beam of yellow light flashes from your pointing finger, then condenses to linger at a chosen point within range as a glowing bead for the duration. When the spell ends, either because your concentration is broken or because you decide to end it, the bead blossoms with a low roar into an explosion of flame that spreads around corners. Each creature in a 20-foot-radius sphere centered on that point must make a Dexterity saving throw. A creature takes fire damage equal to the total accumulated damage on a failed save, or half as much damage on a successful one.

The spell's base damage is 12d6. If at the end of your turn the bead has not yet detonated, the damage increases by 1d6.

If the glowing bead is touched before the interval has expired, the creature touching it must make a Dexterity saving throw. On a failed save, the spell ends immediately, causing the bead to erupt in flame. On a successful save, the creature can throw the bead up to 40 feet. When it strikes a creature or a solid object, the spell ends, and the bead explodes.

The fire damages objects in the area and ignites flammable objects that aren't being worn or carried.

At Higher Levels: When you cast this spell using a spell slot of 8th level or higher, the base damage increases by 1d6 for each slot level above 7th.",
  school: 'evocation',
  range: '150 feet',
  components: ['V','S','M (a tiny ball of bat guano and sulfur)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '12d6',
  },
  dmg_type: 'Fire',
  id: 90,
)

Spell.create(
  name: 'Demiplane',
  level: 8,
  description: "You create a shadowy door on a flat solid surface that you can see within range. The door is large enough to allow Medium creatures to pass through unhindered. When opened, the door leads to a demiplane that appears to be an empty room 30 feet in each dimension, made of wood or stone. When the spell ends, the door disappears, and any creatures or objects inside the demiplane remain trapped there, as the door also disappears from the other side.

Each time you cast this spell, you can create a new demiplane, or have the shadowy door connect to a demiplane you created with a previous casting of this spell. Additionally, if you know the nature and contents of a demiplane created by a casting of this spell by another creature, you can have the shadowy door connect to its demiplane instead.",
  school: 'conjuration',
  range: '60 feet',
  components: ['S'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 91,
)

Spell.create(
  name: 'Destructive Wave',
  level: 5,
  description: "You strike the ground, creating a burst of divine energy that ripples outward from you. Each creature you choose within 30 feet of you must succeed on a Constitution saving throw or take 5d6 thunder damage, as well as 5d6 radiant or necrotic damage (your choice), and be knocked prone. A creature that succeeds on its saving throw takes half as much damage and isn’t knocked prone.",
  school: 'evocation',
  range: 'Self (30-foot radius)',
  components: ['V'],
  attack: 'true',
  atk_dmg: {
    1=> '10d6',
  },
  dmg_type: 'Mixed',
  id: 92,
)

Spell.create(
  name: 'Detect Evil and Good',
  level: 1,
  description: "For the duration, you know if there is an aberration, celestial, elemental, fey, fiend, or undead within 30 feet of you, as well as where the creature is located. Similarly, you know if there is a place or object within 30 feet of you that has been magically consecrated or desecrated. The spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.",
  school: 'divination',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 93,
)

Spell.create(
  name: 'Detect Magic',
  level: 1,
  description: "For the duration, you sense the presence of magic within 30 feet of you. If you sense magic in this way, you can use your action to see a faint aura around any visible creature or object in the area that bears magic, and you learn its school of magic, if any.

The spell can penetrate most barriers, but is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.",
  school: 'divination',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 94,
)

Spell.create(
  name: 'Detect Poison and Disease',
  level: 1,
  description: "For the duration, you can sense the presence and location of poisons, poisonous creatures, and diseases within 30 feet of you. You also identify the kind of poison, poisonous creature, or disease in each case.

The spell can penetrate most barriers, but is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.",
  school: 'divination',
  ritual: 1,
  components: ['V','S','M (a yew leaf)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 95,
)

Spell.create(
  name: 'Detect Thoughts',
  level: 2,
  description: "For the duration, you can read the thoughts of certain creatures. When you cast the spell and as your action on each turn until the spell ends, you can focus your mind on any one creature that you can see within 30 feet of you. If the creature you choose has an Intelligence of 3 or lower or doesn't speak any language, the creature is unaffected.

You initially learn the surface thoughts of the creature - what is most on its mind in that moment. As an action, you can either shift your attention to another creature's thoughts or attempt to probe deeper into the same creature's mind. If you probe deeper, the target must make a Wisdom saving throw. If it fails, you gain insight into its reasoning (if any), its emotional state, and something that looms large in its mind (such as something it worries over, loves, or hates). If it succeeds, the spell ends. Either way, the target knows that you are probing into its mind, and unless you shift your attention to another creature's thoughts, the creature can use its action on its turn to make an Intelligence check contested by your Intelligence check if it succeeds, the spell ends.

Questions verbally directed at the target creature naturally shape the course of its thoughts, so this spell is particularly effective as part of an interrogation.

You can also use this spell to detect the presence of thinking creatures you can't see. When you cast the spell or as your action during the duration, you can search for thoughts within 30 feet of you. The spell can penetrate barriers, but 2 feet of rock, 2 inches of any metal other than lead, or a thin sheet of lead blocks you. You can't detect a creature with an Intelligence of 3 or lower or one that doesn't speak any language.

Once you detect the presence of a creature in this way, you can read its thoughts for the rest of the duration as described above, even if you can't see it, but it must still be within range.",
  school: 'divination',
  components: ['V','S','M (a copper piece)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 96,
)

Spell.create(
  name: 'Dimension Door',
  level: 4,
  description: "You teleport yourself from your current location to any other spot within range. You arrive at exactly the spot desired. It can be a place you can see, one you can visualize, or one you can describe by stating distance and direction, such as 200 feet straight downward or upward to the northwest at a 45-degree angle, 300 feet.

  You can bring along objects as long as their weight doesn't exceed what you can carry. You can also bring one willing creature of your size or smaller who is carrying gear up to its carrying capacity. The creature must be within 5 feet of you when you cast this spell.

  If you would arrive in a place already occupied by an object or a creature, you and any creature traveling with you each take 4d6 force damage, and the spell fails to teleport you.",
  school: 'conjuration',
  range: '500 feet',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 97,
)

Spell.create(
  name: 'Disguise Self',
  level: 1,
  description: "You make yourself, including your clothing, armor, weapons, and other belongings on your person, look different until the spell ends or until you use your action to dismiss it. You can seem 1 foot shorter or taller and can appear thin, fat, or in between. You can't change your body type, so you must adopt a form that has the same basic arrangement of limbs. Otherwise, the extent of the illusion is up to you.

The changes wrought by this spell fail to hold up to physical inspection. For example, if you use this spell to add a hat to your outfit, objects pass through the hat, and anyone who touches it would feel nothing or would feel your head and hair. If you use this spell to appear thinner than you are, the hand of someone who reaches out to touch you would bump into you while it was seemingly still in midair.

To discern that you are disguised, a creature can use its action to inspect your appearance and must succeed on an Intelligence (Investigation) check against your spell save DC.",
  school: 'illusion',
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 98,
)

Spell.create(
  name: 'Disintegrate',
  level: 6,
  description: "A thin green ray springs from your pointing finger to a target that you can see within range. The target can be a creature, an object, or a creation of magical force, such as the wall created by Wall of Force.

A creature targeted by this spell must make a Dexterity saving throw. On a failed save, the target takes 10d6+40 force damage. If this damage reduces the target to 0 hit points, it is disintegrated.

A disintegrated creature and everything it is wearing and carrying, except magic items, are reduced to a pile of fine gray dust. The creature can be restored to life only by means of a true resurrection or a wish spell.

This spell automatically disintegrates a Large or smaller nonmagical object or a creation of magical force. If the target is a Huge or larger object or creation of force, this spell disintegrates a 10-foot-cube portion of it. A magic item is unaffected by this spell.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, the damage increases by 3d6 for each slot level above 6th.",
  school: 'transmutation',
  range: '60 feet',
  components: ['V','S','M (a lodestone and a pinch of dust)'],
  attack: 'true',
  atk_dmg: {
    1=> '10d6 + 40',
  },
  dmg_type: 'Force',
  id: 99,
)

Spell.create(
  name: 'Dispel Evil and Good',
  level: 5,
  description: "Shimmering energy surrounds and protects you from fey, undead, and creatures originating from beyond the Material Plane. For the duration, celestials, elementals, fey, fiends, and undead have disadvantage on attack rolls against you. You can end the spell early by using either of the following special functions.

Break Enchantment: As your action, you touch a creature you can reach that is charmed, frightened, or possessed by a celestial, an elemental, a fey, a fiend, or an undead. The creature you touch is no longer charmed, frightened, or possessed by such creatures.

Dismissal: As your action, make a melee spell attack against a celestial, an elemental, a fey, a fiend, or an undead you can reach. On a hit, you attempt to drive the creature back to its home plane. The creature must succeed on a Charisma saving throw or be sent back to its home plane (if it isn't there already). If they aren't on their home plane, undead are sent to the Shadowfell, and fey are sent to the Feywild.",
  school: 'abjuration',
  components: ['V','S','M (holy water or powdere silver and iron)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 100,
)

Spell.create(
  name: 'Dispel Magic',
  level: 3,
  description: "Choose any creature, object, or magical effect within range. Any spell of 3rd level or lower on the target ends. For each spell of or higher on the target, make an ability check using your spellcasting ability. The DC equals 10 + the spell's level. On a successful check, the spell ends.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, you automatically end the effects of a spell on the target if the spell's level is equal to or less than the level of the spell slot you used.",
  school: 'abjuration',
  range: '120 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 101,
)

Spell.create(
  name: 'Dissonant Whispers',
  level: 1,
  description: "You whisper a discordant melody that only one creature of your choice within range can hear, wracking it with terrible pain. The target must make a Wisdom saving throw. On a failed save, it takes 3d6 psychic damage and must immediately use its reaction, if available, to move as far as its speed allows away from you. The creature doesn’t move into obviously dangerous ground, such as a fire or a pit. On a successful save, the target takes half as much damage and doesn’t have to move away. A deafened creature automatically succeeds on the save.

At Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.",
  school: 'enchantment',
  range: '60 feet',
  components: ['V'],
  attack: 'true',
  atk_dmg: {
    1=> '3d6',
  },
  dmg_type: 'Psychic',
  id: 102,
)

Spell.create(
  name: 'Divination',
  level: 4,
  description: "Your magic and an offering put you in contact with a god or a god's servants. You ask a single question concerning a specific goal, event, or activity to occur within 7 days. The DM offers a truthful reply. The reply might be a short phrase, a cryptic rhyme, or an omen.

The spell doesn't take into account any possible circumstances that might change the outcome, such as the casting of additional spells or the loss or gain of a companion.

If you cast this spell two or more times before finishing your next long rest, there is a cumulative 25 percent chance for each casting after the first that you get a random reading. The DM makes this roll in secret.",
  school: 'divination',
  ritual: 1,
  components: ['V','S','M (incense and a sacrificial offering appropriate to your religion, together worth at least 25 gp, which the spell consumes)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 103,
)

Spell.create(
  name: 'Divine Word',
  level: 7,
  description: "You utter a divine word, imbued with the power that shaped the world at the dawn of creation. Choose any number of creatures you can see within range. Each creature that can hear you must make a Charisma saving throw. On a failed save, a creature suffers an effect based on its current hit points.

• 50 hit points or fewer - deafened for 1 minute

• 40 hit points or fewer - deafened and blinded for 10 minutes

• 30 hit points or fewer - blinded, deafened, and stunned for 1 hour

• 20 hit points or fewer - killed instantly

Regardless of its current hit points, a celestial, an elemental, a fey, or a fiend that fails its save is forced back to its plane of origin (if it isn't there already) and can't return to your current plane for 24 hours by any means short of a wish spell.",
  school: 'evocation',
  cast_time: '1 bonus action',
  range: '30 feet',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 104,
)

Spell.create(
  name: 'Dominate Beast',
  level: 4,
  description: "You attempt to beguile a beast that you can see within range. It must succeed on a Wisdom saving throw or be charmed by you for the duration. If you or creatures that are friendly to you are fighting it, it has advantage on the saving throw.

While the beast is charmed, you have a telepathic link with it as long as the two of you are on the same plane of existence. You can use this telepathic link to issue commands to the creature while you are conscious (no action required), which it does its best to obey. You can specify a simple and general course of action, such as Attack that creature, Run over there, or Fetch that object. If the creature completes the order and doesn't receive further direction from you, it defends and preserves itself to the best of its ability.

You can use your action to take total and precise control of the target. Until the end of your next turn, the creature takes only the actions you choose, and doesn't do anything that you don't allow it to do. During this time, you can also cause the creature to use a reaction, but this requires you to use your own reaction as well.

Each time the target takes damage, it makes a new Wisdom saving throw against the spell. If the saving throw succeeds, the spell ends.

At Higher Levels: When you cast this spell with a 5th-level spell slot, the duration is concentration, up to 10 minutes. When you use a 6th-level spell slot, the duration is concentration, up to 1 hour. When you use a spell slot of 7th level or higher, the duration is concentration, up to 8 hours.",
  school: 'enchantment',
  range: '60 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 105,
)

Spell.create(
  name: 'Dominate Monster',
  level: 8,
  description: "You attempt to beguile a creature that you can see within range. It must succeed on a Wisdom saving throw or be charmed by you for the duration. If you or creatures that are friendly to you are fighting it, it has advantage on the saving throw.

While the creature is charmed, you have a telepathic link with it as long as the two of you are on the same plane of existence. You can use this telepathic link to issue commands to the creature while you are conscious (no action required), which it does its best to obey. You can specify a simple and general course of action, such as Attack that creature, Run over there, or Fetch that object. If the creature completes the order and doesn't receive further direction from you, it defends and preserves itself to the best of its ability.

You can use your action to take total and precise control of the target. Until the end of your next turn, the creature takes only the actions you choose, and doesn't do anything that you don't allow it to do. During this time, you can also cause the creature to use a reaction, but this requires you to use your own reaction as well.

Each time the target takes damage, it makes a new Wisdom saving throw against the spell. If the saving throw succeeds, the spell ends.

At Higher Levels: When you cast this spell with a 9th-level spell slot, the duration is concentration, up to 8 hours.",
  school: 'enchantment',
  range: '60 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 106,
)

Spell.create(
  name: 'Dominate Person',
  level: 5,
  description: "You attempt to beguile a humanoid that you can see within range. It must succeed on a Wisdom saving throw or be charmed by you for the duration. If you or creatures that are friendly to you are fighting it, it has advantage on the saving throw.

While the target is charmed, you have a telepathic link with it as long as the two of you are on the same plane of existence. You can use this telepathic link to issue commands to the creature while you are conscious (no action required), which it does its best to obey. You can specify a simple and general course of action, such as Attack that creature, Run over there, or Fetch that object. If the creature completes the order and doesn't receive further direction from you, it defends and preserves itself to the best of its ability.

You can use your action to take total and precise control of the target. Until the end of your next turn, the creature takes only the actions you choose, and doesn't do anything that you don't allow it to do. During this time, you can also cause the creature to use a reaction, but this requires you to use your own reaction as well.

Each time the target takes damage, it makes a new Wisdom saving throw against the spell. If the saving throw succeeds, the spell ends.

At Higher Levels: When you cast this spell using a 6th-level spell slot, the duration is concentration, up to 10 minutes. When you use a 7th-level spell slot, the duration is concentration, up to 1 hour. When you use a spell slot of 8th level or higher, the duration is concentration, up to 8 hours.",
  school: 'enchantment',
  range: '60 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 107,
)

Spell.create(
  name: "Drawmij's Instant Summons",
  level: 6,
  description: "You touch an object weighing 10 pounds or less whose longest dimension is 6 feet or less. The spell leaves an invisible mark on its surface and invisibly inscribes the name of the item on the sapphire you use as the material component. Each time you cast this spell, you must use a different sapphire.

At any time thereafter, you can use your action to speak the item's name and crush the sapphire. The item instantly appears in your hand regardless of physical or planar distances, and the spell ends.

If another creature is holding or carrying the item, crushing the sapphire doesn't transport the item to you, but instead you learn who the creature possessing the object is and roughly where that creature is located at that moment.

Dispel magic or a similar effect successfully applied to the sapphire ends this spell's effect.",
  school: 'conjuration',
  ritual: 1,
  cast_time: '1 minute',
  range: 'Touch',
  components: ['V','S','M (a sapphire worth 1,000 gp)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 108,
)

Spell.create(
  name: 'Dream',
  level: 5,
  description: "This spell shapes a creature's dreams. Choose a creature known to you as the target of this spell. The target must be on the same plane of existence as you. Creatures that don't sleep, such as elves, can't be contacted by this spell. You, or a willing creature you touch, enters a trance state, acting as a messenger. While in the trance, the messenger is aware of his or her surroundings, but can't take actions or move.

If the target is asleep, the messenger appears in the target's dreams and can converse with the target as long as it remains asleep, through the duration of the spell. The messenger can also shape the environment of the dream, creating landscapes, objects, and other images. The messenger can emerge from the trance at any time, ending the effect of the spell early. The target recalls the dream perfectly upon waking. If the target is awake when you cast the spell, the messenger knows it, and can either end the trance (and the spell) or wait for the target to fall asleep, at which point the messenger appears in the target's dreams.

You can make the messenger appear monstrous and terrifying to the target. If you do, the messenger can deliver a message of no more than ten words and then the target must make a Wisdom saving throw. On a failed save, echoes of the phantasmal monstrosity spawn a nightmare that lasts the duration of the target's sleep and prevents the target from gaining any benefit from that rest. In addition, when the target wakes up, it takes 3d6 psychic damage.

If you have a body part, lock of hair, clipping from a nail, or similar portion of the target's body, the target makes its saving throw with disadvantage.",
  school: 'illusion',
  cast_time: '1 minute',
  range: 'Special',
  components: ['V','S','M (a handful of sand, a dab of ink, and a writing quill plucked from a sleeping bird)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 109,
)

Spell.create(
  name: "Druidcraft",
  level: 0,
  description: "Whispering to the spirits of nature, you create one of the following effects within range:

You create a tiny, harmless sensory effect that predicts what the weather will be at your location for the next 24 hours. The effect might manifest as a golden orb for clear skies, a cloud for rain falling snowflakes for snow, and so on. This effect persists for 1 round.
You instantly make a flower blossom, a seed pod open, or a leaf bud bloom.
You create an instantaneous, harmless sensory effect, such as falling leaves, a puff of wind, the sound of a small animal, or the faint odor of skunk. The effect must fit in a 5-foot cube.
You instantly light or snuff out a candle, a torch, or a small campfire.",
  school: 'transmutation',
  range: '30 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 110,
)

Spell.create(
  name: "Earthquake",
  level: 8,
  description: "You create a seismic disturbance at a point on the ground that you can see within range. For the duration, an intense tremor rips through the ground in a 100-foot- radius circle centered on that point and shakes creatures and structures in contact with the ground in that area.

The ground in the area becomes difficult terrain. Each creature on the ground that is concentrating must make a Constitution saving throw. On a failed save, the creature's concentration is broken.

When you cast this spell and at the end of each turn you spend concentrating on it, each creature on the ground in the area must make a Dexterity saving throw. On a failed save, the creature is knocked prone.

This spell can have additional effects depending on the terrain in the area, as determined by the DM.",
  school: 'evocation',
  range: '500 feet',
  components: ['V','S','M (a pinch of dirt, a piece of rock, and a lump of clay)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 111,
)

Spell.create(
  name: "Eldritch Blast",
  level: 0,
  description: "A beam of crackling energy streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 force damage.

The spell creates more than one beam when you reach higher levels: two beams at 5th level, three beams at 11th level, and four beams at 17th level. You can direct the beams at the same target or at different ones. Make a separate attack roll for each beam.",
  school: 'evocation',
  range: '120 feet',
  attack: 'true',
  atk_dmg: {
    1=> '1d10',
    5=> '2d10',
    11=> '3d10',
    17=> '4d10',
  },
  dmg_type: 'Force',
  id: 112,
)

Spell.create(
  name: "Elemental Weapon",
  level: 3,
  description: "A nonmagical weapon you touch becomes a magic weapon. Choose one of the following damage types: acid, cold, fire, lightning, or thunder. For the duration, the weapon has a +1 bonus to attack rolls and deals an extra 1d4 damage of the chosen type when it hits.

At Higher Levels. When you cast this spell using a spell slot of 5th or 6th level, the bonus to attack rolls increases to +2 and the extra damage increases to 2d4. When you use a spell slot of 7th level or higher, the bonus increases to +3 and the extra damage increases to 3d4.",
  school: 'transmutation',
  range: 'Touch',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 113
)

Spell.create(
  name: "Enhance Ability",
  level: 2,
  description: "You touch a creature and bestow upon it a magical enhancement. Choose one of the following effects - the target gains the effect until the spell ends.

Bear's Endurance: The target has advantage on Constitution checks. It also gains 2d6 temporary hit points, which are lost when the spell ends.

Bull's Strength: The target has advantage on Strength checks, and his or her carrying capacity doubles.

Cat's Grace: The target has advantage on Dexterity checks. It also doesn't take damage from falling 20 feet or less if it isn't incapacitated.

Eagle's Splendor: The target has advantage on Charisma checks.

Fox's Cunning: The target has advantage on Intelligence checks.

Owl's Wisdom: The target has advantage on Wisdom checks.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, you can target one additional creature for each slot level above 2nd.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (fur or a feather from a beast)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 114,
)

Spell.create(
  name: "Enlarge/Reduce",
  level: 2,
  description: "You cause a creature or an object you can see within range to grow larger or smaller for the duration. Choose either a creature or an object that is neither worn nor carried. If the target is unwilling, it can make a Constitution saving throw. On a success, the spell has no effect.

If the target is a creature, everything it is wearing and carrying changes size with it. Any item dropped by an affected creature returns to normal size at once.

Enlarge. The target's size doubles in all dimensions, and its weight is multiplied by eight. This growth increases its size by one category - from Medium to Large, for example. If there isn't enough room for the target to double its size, the creature or object attains the maximum possible size in the space available. Until the spell ends, the target also has advantage on Strength checks and Strength saving throws. The target's weapons also grow to match its new size. While these weapons are enlarged, the target's attack with them deal 1d4 extra damage.

Reduce. The target's size is halved in all dimensions, and its weight is reduced to one-eighth of normal. This reduction decreases its size by one category - from Medium to Small, for example. Until the spell ends, the target also has disadvantage on Strength checks and Strength saving throws. The target's weapons also shrink to match its new size. While these weapons are reduced, the target's attacks with them deal 1d4 less damage (this can't reduce the damage below 1).",
  school: 'transmutation',
  range: '30 feet',
  components: ['V','S','M (a pinch of powdered iron)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 115,
)

Spell.create(
  name: "Ensnaring Strike",
  level: 1,
  description: "The next time you hit a creature with a weapon attack before this spell ends, a writhing mass of thorny vines appears at the point of impact, and the target must succeed on a Strength saving throw or be restrained by the magical vines until the spell ends. A Large or larger creature has advantage on this saving throw. If the target succeeds on the save, the vines shrivel away.

While restrained by this spell, the target takes 1d6 piercing damage at the start of each of its turns. A creature restrained by the vines or one that can touch the creature can use its action to make a Strength check against your spell save DC. On a success, the target is freed.

At Higher Levels. If you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.",
  school: 'conjuration',
  cast_time: '1 bonus action',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 116
)

Spell.create(
  name: "Entangle",
  level: 1,
  description: "Grasping weeds and vines sprout from the ground in a 20-foot square starting from a point within range. For the duration, these plants turn the ground in the area into difficult terrain.

A creature in the area when you cast the spell must succeed on a Strength saving throw or be restrained by the entangling plants until the spell ends. A creature restrained by the plants can use its action to make a Strength check against your spell save DC. On a success, it frees itself.

When the spell ends, the conjured plants wilt away.",
  school: 'conjuration',
  range: '90 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 117
)

Spell.create(
  name: "Enthrall",
  level: 2,
  description: "You weave a distracting string of words, causing creatures of your choice that you can see within range and that can hear you to make a Wisdom saving throw. Any creature that can't be charmed succeeds on this saving throw automatically, and if you or your companions are fighting a creature, it has advantage on the save. On a failed save, the target has disadvantage on Wisdom (Perception) checks made to perceive any creature other than you until the spell ends or until the target can no longer hear you. The spell ends if you are incapacitated or can no longer speak.",
  school: 'enchantment',
  range: '60 feet',
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 118,
)

Spell.create(
  name: "Etherealness",
  level: 7,
  description: "You step into the border regions of the Ethereal Plane, in the area where it overlaps with your current plane. You remain in the Border Ethereal for the duration or until you use your action to dismiss the spell. During this time, you can move in any direction. If you move up or down, every foot of movement costs an extra foot. You can see and hear the plane you originated from, but everything there looks gray, and you can't see anything more than 60 feet away.

While on the Ethereal Plane, you can only affect and be affected by other creatures on that plane. Creatures that aren't on the Ethereal Plane can't perceive you and can't interact with you, unless a special ability or magic has given them the ability to do so.

You ignore all objects and effects that aren't on the Ethereal Plane, allowing you to move through objects you perceive on the plane you originated from.

When the spell ends, you immediately return to the plane you originated from in the spot you currently occupy. If you occupy the same spot as a solid object or creature when this happens, you are immediately shunted to the nearest unoccupied space that you can occupy and take force damage equal to twice the number of feet you are moved.

This spell has no effect if you cast it while you are on the Ethereal Plane or a plane that doesn't border it, such as one of the Outer Planes.

At Higher Levels: When you cast this spell using a spell slot of 8th level or higher, you can target up to three willing creatures (including you) for each slot level above 7th. The creatures must be within 10 feet of you when you cast the spell.",
  school: 'transmutation',
  duration: 'Up to 8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 119,
)

Spell.create(
  name: "Evard's Black Tentacles",
  level: 4,
  description: "Squirming, ebony tentacles fill a 20-foot square on ground that you can see within range. For the duration, these tentacles turn the ground in the area into difficult terrain.

When a creature enters the affected area for the first time on a turn or starts its turn there, the creature must succeed on a Dexterity saving throw or take 3d6 bludgeoning damage and be restrained by the tentacles until the spell ends. A creature that starts its turn in the area and is already restrained by the tentacles takes 3d6 bludgeoning damage.

A creature restrained by the tentacles can use its action to make a Strength or Dexterity check (its choice) against your spell save DC. On a success, it frees itself.",
  school: 'conjuration',
  range: '90 feet',
  components: ['V','S','M (a piece of tentacle from an octopus or giant squid)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 120,
)

Spell.create(
  name: "Expeditious Retreat",
  level: 1,
  description: "This spell allows you to move at an incredible pace. When you cast this spell, and then as a bonus action on each of your turns until the spell ends, you can take the Dash action.",
  school: 'transmutation',
  cast_time: '1 bonus action',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 121,
)

Spell.create(
  name: "Eyebite",
  level: 6,
  description: "For the spell's duration, your eyes become an inky void imbued with dread power. One creature of your choice within 60 feet of you that you can see must succeed on a Wisdom saving throw or be affected by one of the following effects of your choice for the duration. On each of your turns until the spell ends, you can use your action to target another creature but can't target a creature again if it has succeeded on a saving throw against this casting of Eyebite.

Asleep: The target falls unconscious. It wakes up if it takes any damage or if another creature uses its action to shake the sleeper awake.

Panicked: The target is frightened of you. On each of its turns, the frightened creature must take the Dash action and move away from you by the safest and shortest available route, unless there is nowhere to move. If the target moves to a place at least 60 feet away from you where it can no longer see you, this effect ends.

Sickened: The target has disadvantage on attack rolls and ability checks. At the end of each of its turns, it can make another Wisdom saving throw. If it succeeds, the effect ends.",
  school: 'necromancy',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 122,
)

Spell.create(
  name: "Fabricate",
  level: 4,
  description: "You convert raw materials into products of the same material. For example, you can fabricate a wooden bridge from a clump of trees, a rope from a patch of hemp, and clothes from flax or wool.

Choose raw materials that you can see within range. You can fabricate a Large or smaller object (contained within a 10-foot cube, or eight connected 5-foot cubes), given a sufficient quantity of raw material. If you are working with metal, stone, or another mineral substance, however, the fabricated object can be no larger than Medium (contained within a single 5-foot cube). The quality of objects made by the spell is commensurate with the quality of the raw materials.

Creatures or magic items can't be created or transmuted by this spell. You also can't use it to create items that ordinarily require a high degree of craftsmanship, such as jewelry, weapons, glass, or armor, unless you have proficiency with the type of artisan's tools used to craft such objects.",
  school: 'transmutation',
  cast_time: '10 minutes',
  range: '120 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 123,
)

Spell.create(
  name: "Faerie Fire",
  level: 1,
  description: "Each object in a 20-foot cube within range is outlined in blue, green, or violet light (your choice). Any creature in the area when the spell is cast is also outlined in light if it fails a Dexterity saving throw. For the duration, objects and affected creatures shed dim light in a 10-foot radius.

Any attack roll against an affected creature or object has advantage if the attacker can see it, and the affected creature or object can't benefit from being invisible.",
  school: 'evocation',
  range: '60 feet',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 124,
)

Spell.create(
  name: "False Life",
  level: 1,
  description: "Bolstering yourself with a necromantic facsimile of life, you gain 1d4+4 temporary hit points for the duration.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you gain 5 additional temporary hit points for each slot level above 1st.",
  school: 'necromancy',
  components: ['V','S','M (a small amount of alcohol or distilled spirits)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 125,
)

Spell.create(
  name: "Fear",
  level: 3,
  description: "You project a phantasmal image of a creature's worst fears. Each creature in a 30-foot cone must succeed on a Wisdom saving throw or drop whatever it is holding and become frightened for the duration.

While frightened by this spell, a creature must take the Dash action and move away from you by the safest available route on each of its turns, unless there is nowhere to move. If the creature ends its turn in a location where it doesn't have line of sight to you, the creature can make a Wisdom saving throw. On a successful save, the spell ends for that creature.",
  school: 'illusion',
  cast_time: '',
  range: 'Self (30-foot cone)',
  components: ['V','S','M (a white feather or the heart of a hen)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 126,
)

Spell.create(
  name: "Feather Fall",
  level: 1,
  description: "When you or a creature within 60 feet of you falls Choose up to five falling creatures within range. A falling creature's rate of descent slows to 60 feet per round until the spell ends. If the creature lands before the spell ends, it takes no falling damage and can land on its feet, and the spell ends for that creature.",
  school: 'transmutation',
  cast_time: '1 reaction',
  range: '60 feet',
  components: ['V','M (a small feather or piece of down)'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 127,
)

Spell.create(
  name: "Feeblemind",
  level: 8,
  description: "You blast the mind of a creature that you can see within range, attempting to shatter its intellect and personality. The target takes 4d6 psychic damage and must make an Intelligence saving throw.

On a failed save, the creature's Intelligence and Charisma scores become 1. The creature can't cast spells, activate magic items, understand language, or communicate in any intelligible way. The creature can, however, identify its friends, follow them, and even protect them.

At the end of every 30 days, the creature can repeat its saving throw against this spell. If it succeeds on its saving throw, the spell ends.

The spell can also be ended by greater restoration, heal or wish.",
  school: 'enchantment',
  range: '150 feet',
  components: ['V','S','M (a handful of clay, crystal, glass, or mineral spheres)'],
  attack: 'true',
  atk_dmg: {
    1=> '4d6',
  },
  dmg_type: 'Psychic',
  id: 128,
)

Spell.create(
  name: "Feign Death",
  level: 3,
  description: "You touch a willing creature and put it into a cataleptic state that is indistinguishable from death.

For the spell’s duration, or until you use an action to touch the target and dismiss the spell, the target appears dead to all outward inspection and to spells used to determine the target’s status. The target is blinded and incapacitated, and its speed drops to 0. The target has resistance to all damage except psychic damage. If the target is diseased or poisoned when you cast the spell, or becomes diseased or poisoned while under the spell’s effect, the disease and poison have no effect until the spell ends.",
  school: 'necromancy',
  ritual: 1,
  range: 'Touch',
  components: ['V','S','M (a pinch of graveyard dirt)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 129,
)

Spell.create(
  name: "Find Familiar",
  level: 1,
  description: "You gain the service of a familiar, a spirit that takes an animal form you choose: bat, cat, crab, frog (toad), hawk, lizard, octopus, owl, poisonous snake, fish (quipper), rat, raven, sea horse, spider, or weasel. Appearing in an unoccupied space within range, the familiar has the statistics of the chosen form, though it is a celestial, fey, or fiend (your choice) instead of a beast.

Your familiar acts independently of you, but it always obeys your commands. In combat, it rolls its own initiative and acts on its own turn. A familiar can't attack, but it can take other actions as normal.

When the familiar drops to 0 hit points, it disappears, leaving behind no physical form. It reappears after you cast this spell again.

While your familiar is within 100 feet of you, you can communicate with it telepathically. Additionally, as an action, you can see through your familiar's eyes and hear what it hears until the start of your next turn, gaining the benefits of any special senses that the familiar has. During this time, you are deaf and blind with regard to your own senses.

As an action, you can temporarily dismiss your familiar. It disappears into a pocket dimension where it awaits your summons. Alternatively, you can dismiss it forever. As an action while it is temporarily dismissed, you can cause it to reappear in any unoccupied space within 30 feet of you.

You can't have more than one familiar at a time. If you cast this spell while you already have a familiar, you instead cause it to adopt a new form. Choose one of the forms from the above list. Your familiar transforms into the chosen creature.

Finally, when you cast a spell with a range of touch, your familiar can deliver the spell as if it had cast the spell. Your familiar must be within 100 feet of you, and it must use its reaction to deliver the spell when you cast it. If the spell requires an attack roll, you use your attack modifier for the roll.",
  school: 'conjuration',
  ritual: 1,
  cast_time: '1 hour',
  range: '10 feet',
  components: ['V','S','M (10 gp worth of charcoal, incense, and herbs that must be consumed by fire in a brass brazier)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 130,
)

Spell.create(
  name: "Find Steed",
  level: 2,
  description: "You summon a spirit that assumes the form of an unusually intelligent, strong, and loyal steed, creating a long-lasting bond with it. Appearing in an unoccupied space within range, the steed takes on a form that you choose, such as a warhorse, a pony, a camel, an elk, or a mastiff. (Your DM might allow other animals to be summoned as steeds.) The steed has the statistics of the chosen form, though it is a celestial, fey, or fiend (your choice) instead of its normal type. Additionally, if your steed has an Intelligence of 5 or less, its Intelligence becomes 6, and it gains the ability to understand one language of your choice that you speak.

Your steed serves you as a mount, both in combat and out, and you have an instinctive bond with it that allows you to fight as a seamless unit. While mounted on your steed, you can make any spell you cast that targets only you also target your steed.

When the steed drops to 0 hit points, it disappears, leaving behind no physical form. You can also dismiss your steed at any time as an action, causing it to disappear. In either case, casting this spell again summons the same steed, restored to its hit point maximum.

While your steed is within 1 mile of you, you can communicate with it telepathically.

You can't have more than one steed bonded by this spell at a time. As an action, you can release the steed from its bond at any time, causing it to disappear.",
  school: 'conjuration',
  cast_time: '10 minutes',
  range: '30 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 131,
)

Spell.create(
  name: "Find the Path",
  level: 6,
  description: "This spell allows you to find the shortest, most direct physical route to a specific fixed location that you are familiar with on the same plane of existence. If you name a destination on another plane of existence, a destination that moves (such as a mobile fortress), or a destination that isn't specific (such as a green dragon's lair), the spell fails.

For the duration, as long as you are on the same plane of existence as the destination, you know how far it is and in what direction it lies. While you are traveling there, whenever you are presented with a choice of paths along the way, you automatically determine which path is the shortest and most direct route (but not necessarily the safest route) to the destination.",
  school: 'divination',
  cast_time: '1 minute',
  components: ['V','S','M (a sest of divinatory tools - such as bones, ivory sticks, cards or teeth - worth 100gp and an object from the location you wish to find)'],
  duration: 'Concentration, up to 1 day',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 132,
)

Spell.create(
  name: "Find Traps",
  level: 2,
  description: "You sense the presence of any trap within range that is within line of sight. A trap, for the purpose of this spell, includes anything that would inflict a sudden or unexpected effect you consider harmful or undesirable, which was specifically intended as such by its creator. Thus, the spell would sense an area affected by the alarm spell, a glyph of warding, or a mechanical pit trap, but it would not reveal a natural weakness in the floor, an unstable ceiling, or a hidden sinkhole.

This spell merely reveals that a trap is present. You don't learn the location of each trap, but you do learn the general nature of the danger posed by a trap you sense.",
  school: 'divination',
  range: '120 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 133,
)

Spell.create(
  name: "Finger of Death",
  level: 7,
  description: "You send negative energy coursing through a creature that you can see within range, causing it searing pain. The target must make a Constitution saving throw. It takes 7d8+30 necrotic damage on a failed save, or half as much damage on a successful one.

A humanoid killed by this spell rises at the start of your next turn as a zombie that is permanently under your command, following your verbal orders to the best of its ability.",
  school: 'necromancy',
  range: '60 feet',
  attack: 'true',
  atk_dmg: {
    1=> '7d8 + 30',
  },
  dmg_type: 'Necrotic',
  id: 134,
)

Spell.create(
  name: "Fireball",
  level: 3,
  description: "A bright streak flashes from your pointing finger to a point you choose within range then blossoms with a low roar into an explosion of flame. Each creature in a 20-foot radius sphere centered on that point must make a Dexterity saving throw. A target takes 8d6 fire damage on a failed save, or half as much damage on a successful one.

The fire spreads around corners. It ignites flammable objects in the area that aren't being worn or carried.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d6 for each slot level above 3rd.",
  school: 'evocation',
  range: '150 feet',
  components: ['V','S','M (a tiny ball of bat guano and sulfur)'],
  attack: 'true',
  atk_dmg: {
    1=> '8d6',
  },
  dmg_type: 'Fire',
  id: 135,
)

Spell.create(
  name: "Fire Bolt",
  level: 0,
  description: "You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn't being worn or carried.

This spell's damage increases by 1d10 when you reach 5th level (2d10), 11th level (3d10), and 17th level (4d10).",
  school: 'evocation',
  range: '120 feet',
  attack: 'true',
  atk_dmg: {
    1=> '1d10',
    5=> '2d10',
    11=> '3d10',
    17=> '4d10',
  },
  dmg_type: 'Fire',
  id: 136,
)

Spell.create(
  name: "Fire Shield",
  level: 4,
  description: "Thin and wispy flames wreathe your body for the duration, shedding bright light in a 10-foot radius and dim light for an additional 10 feet. You can end the spell early by using an action to dismiss it.

The flames provide you with a warm shield or a chill shield, as you choose. The warm shield grants you resistance to cold damage, and the chill shield grants you resistance to fire damage.

In addition, whenever a creature within 5 feet of you hits you with a melee attack, the shield erupts with flame. The attacker takes 2d8 fire damage from a warm shield, or 2d8 cold damage from a cold shield.",
  school: 'evocation',
  components: ['V','S','M (a bit of phosphorous or a firefly)'],
  duration: '10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 137,
)

Spell.create(
  name: "Fie Storm",
  level: 7,
  description: "A storm made up of sheets of roaring flame appears in a location you choose within range. The area of the storm consists of up to ten 10-foot cubes, which you can arrange as you wish. Each cube must have at least one face adjacent to the face of another cube. Each creature in the area must make Dexterity saving throw. It takes 7d10 fire damage on a failed save, or half as much damage on a successful one.

The fire damages objects in the area and ignites flammable objects that aren't being worn or carried. If you choose, plant life in the area is unaffected by this spell.",
  school: 'evocation',
  range: '150 feet',
  attack: 'true',
  atk_dmg: {
    1=> '7d10',
  },
  dmg_type: 'Fire',
  id: 138,
)

Spell.create(
  name: "Flame Blade",
  level: 2,
  description: "You evoke a fiery blade in your free hand. The blade is similar in size and shape to a scimitar, and it lasts for the duration. If you let go of the blade, it disappears, but you can evoke the blade again as a bonus action.

You can use your action to make a melee spell attack with the fiery blade. On a hit, the target takes 3d6 fire damage.

The flaming blade sheds bright light in a 10-foot radius and dim light for an additional 10 feet.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d6 for every two slot levels above 2nd.",
  school: 'evocation',
  range: '60 feet',
  components: ['V','S','M (leaf of sumac)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 139,
)

Spell.create(
  name: "Flame Strike",
  level: 5,
  description: "A vertical column of divine fire roars down from the heavens in a location you specify. Each creature in a 10-foot radius, 40-foot-high cylinder centered on a point within range must make a Dexterity saving throw. A creature takes 4d6 fire damage and 4d6 radiant damage on a failed save, or half as much damage on a successful one.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the fire damage or the radiant damage (your choice) increases by 1d6 for each slot level above 5th.",
  school: 'evocation',
  range: '60 feet',
  components: ['V','S','M (pinch of sulfur)'],
  attack: 'true',
  atk_dmg: {
    1=> '8d6',
  },
  dmg_type: 'Mixed',
  id: 140,
)

Spell.create(
  name: "Flaming Sphere",
  level: 2,
  description: "A 5-foot-diameter sphere of fire appears in an unoccupied space of your choice within range and lasts for the duration. Any creature that ends its turn within 5 feet of the sphere must make a Dexterity saving throw. The creature takes 2d6 fire damage on a failed save, or half as much damage on a successful one.

As a bonus action, you can move the sphere up to 30 feet. If you ram the sphere into a creature, that creature must make the saving throw against the sphere's damage, and the sphere stops moving this turn.

When you move the sphere, you can direct it over barriers up to 5 feet tall and jump it across pits up to 10 feet wide. The sphere ignites flammable objects not being worn or carried, and it sheds bright light in a 20-foot radius and dim light for an additional 20 feet.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 1d6 for each slot level above 2nd.",
  school: 'conjuration',
  range: '60 feet',
  components: ['V','S','M (a bit of tallow, a pinch of brimstone, and a dusting of powdered iron)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '2d6',
  },
  dmg_type: 'Fire',
  id: 141,
)

Spell.create(
  name: "Flesh to Stone",
  level: 6,
  description: "You attempt to turn one creature that you can see within range into stone. If the targets body is made of flesh, the creature must make a Constitution saving throw. On a failed save, it is restrained as its flesh begins to harden. On a successful save, the creature isn't affected.

A creature restrained by this spell must make another Constitution saving throw at the end of each of its turns. If it successfully saves against this spell three times, the spell ends. If it fails saves three times, it is turned to stone and subjected to the petrified condition for the duration. The successes and failures don't need to be consecutive, keep track of both until the target collects three of a kind.

If the creature is physically broken while petrified, it suffers from similar deformities if it reverts to its original state.

If you maintain your concentration on this spell for the entire possible duration, the creature is turned to stone until the effect is removed.",
  school: 'transmutation',
  range: '60 feet',
  components: ['V','S','M (a pinch of lime, water, and earth)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 142,
)

Spell.create(
  name: "Fly",
  level: 3,
  description: "You touch a willing creature. The target gains a flying speed of 60 feet for the duration. When the spell ends, the target falls if it is still aloft, unless it can stop the fall.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, you can target one additional creature for each slot level above 3rd.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (a wing feather from any bird)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 143,
)

Spell.create(
  name: "Fog Cloud",
  level: 1,
  description: "You create a 20-foot-radius sphere of fog centered on a point within range. The sphere spreads around corners, and its area is heavily obscured. It lasts for the duration or until a wind of moderate or greater speed (at least 10 miles per hour) disperses it.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the radius of the fog increases by 20 feet for each slot level above 1st.",
  school: 'conjuration',
  range: '120 feet',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 144,
)

Spell.create(
  name: "Forbiddance",
  level: 6,
  description: "You create a ward against magical travel that protects up to 40,000 square feet of floor space to a height of 30 feet above the floor. For the duration, creatures can't teleport into the area or use portals, such as those created by the gate spell, to enter the area. The spell proofs the area against planar travel, and therefore prevents creatures from accessing the area by way of the Astral Plane, Ethereal Plane, Feywild, Shadowfell, or the plane shift spell.

In addition, the spell damages types of creatures that you choose when you cast it. Choose one or more of the following - celestials, elementals, fey, fiends, and undead. When a chosen creature enters the spell's area for the first time on a turn or starts its turn there, the creature takes 5d10 radiant or necrotic damage (your choice when you cast this spell).

When you cast this spell, you can designate a password. A creature that speaks the password as it enters the area takes no damage from the spell.

The spell's area can't overlap with the area of another forbiddance spell. If you cast forbiddance every day for 30 days in the same location, the spell lasts until it is dispelled, and the material components are consumed on the last casting.",
  school: 'abjuration',
  ritual: 1,
  range: 'Touch',
  cast_time: '10 minutes',
  components: ['V','S','M (a sprinkling of holy water, rare incense, and powdered ruby worth at least 1,000 gp)'],
  duration: '1 day',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 145,
)

Spell.create(
  name: "Forcecage",
  level: 7,
  description: "An immobile, invisible, cube-shaped prison composed of magical force springs into existence around an area you choose within range. The prison can be a cage or a solid box as you choose.

A prison in the shape of a cage can be up to 20 feet on a side and is made from 1/2-inch diameter bars spaced 1/2 inch apart.

A prison in the shape of a box can be up to 10 feet on a side, creating a solid barrier that prevents any matter from passing through it and blocking any spells cast into or out of the area.

When you cast the spell, any creature that is completely inside the cage's area is trapped. Creatures only partially within the area, or those too large to fit inside the area, are pushed away from the center of the area until they are completely outside the area.

A creature inside the cage can't leave it by nonmagical means. If the creature tries to use teleportation or interplanar travel to leave the cage, it must first make a Charisma saving throw. On a success, the creature can use that magic to exit the cage. On a failure, the creature can't exit the cage and wastes the use of the spell or effect. The cage also extends into the Ethereal Plane, blocking ethereal travel.

This spell can't be dispelled by dispel magic.",
  school: 'evocation',
  range: '100 feet',
  components: ['V','S','M (ruby dust worth 1,500 gp)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 146,
)

Spell.create(
  name: "Foresight",
  level: 9,
  description: "You touch a willing creature and bestow a limited ability to see into the immediate future. For the duration, the target can't be surprised and has advantage on attack rolls, ability checks, and saving throws. Additionally, other creatures have disadvantage on attack rolls against the target for the duration.

This spell immediately ends if you cast it again before its duration ends.",
  school: 'divination',
  range: 'Touch',
  cast_time: '1 minute',
  components: ['V','S','M (a hummingbird feather)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 147,
)


Spell.create(
  name: "Freedom of Movement",
  level: 4,
  description: "You touch a willing creature. For the duration, the target's movement is unaffected by difficult terrain, and spells and other magical effects can neither reduce the target's speed nor cause the target to be paralyzed or restrained.

The target can also spend 5 feet of movement to automatically escape from nonmagical restraints, such as manacles or a creature that has it grappled. Finally, being underwater imposes no penalties on the target's movement or attacks.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S','M (a leather strap, bound around the arm or a similar appendage)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 148,
)

Spell.create(
  name: "Friends",
  level: 0,
  description: "For the duration, you have advantage on all Charisma checks directed at one creature of your choice that isn't hostile toward you. When the spell ends, the creature realizes that you used magic to influence its mood and becomes hostile toward you. A creature prone to violence might attack you. Another creature might seek retribution in other ways (at the DM's discretion), depending on the nature of your interaction with it.",
  school: 'enchantment',
  components: ['S','M (a small amount of makeup applied to the face as this spell is cast)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 149,
)

Spell.create(
  name: "Gaseous Form",
  level: 3,
  description: "You transform a willing creature you touch, along with everything it's wearing and carrying, into a misty cloud for the duration. The spell ends if the creature drops to 0 hit points. An incorporeal creature isn't affected.

While in this form, the target's only method of movement is a flying speed of 10 feet. The target can enter and occupy the space of another creature. The target has resistance to nonmagical damage, and it has advantage on Strength, Dexterity, and Constitution saving throws. The target can pass through small holes, narrow openings, and even mere cracks, though it treats liquids as though they were solid surfaces. The target can't fall and remains hovering in the air even when stunned or otherwise incapacitated.

While in the form of a misty cloud, the target can't talk or manipulate objects, and any objects it was carrying or holding can't be dropped, used, or otherwise interacted with. The target can't attack or cast spells.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (a bit of gauze and a wisp of smoke)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 150,
)

Spell.create(
  name: "Gate",
  level: 9,
  description: "You conjure a portal linking an unoccupied space you can see within range to a precise location on a different plane of existence. The portal is a circular opening, which you can make 5 to 20 feet in diameter. You can orient the portal in any direction you choose. The portal lasts for the duration.

The portal has a front and a back on each plane where it appears. Travel through the portal is possible only by moving through its front. Anything that does so is instantly transported to the other plane, appearing in the unoccupied space nearest to the portal.

Deities and other planar rulers can prevent portals created by this spell from opening in their presence or anywhere within their domains.

When you cast this spell, you can speak the name of a specific creature (a pseudonym, title, or nickname doesn't work). If that creature is on a plane other than the one you are on, the portal opens in the named creature's immediate vicinity and draws the creature through it to the nearest unoccupied space on your side of the portal. You gain no special power over the creature, and it is free to act as the DM deems appropriate. It might leave, attack you, or help you.",
  school: 'conjuration',
  range: '60 feet',
  components: ['V','S','M (a diamond worth at least 5,000 gp)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 151,
)

Spell.create(
  name: "Geas",
  level: 5,
  description: "You place a magical command on a creature that you can see within range, forcing it to carry out some service or refrain from some action or course of activity as you decide. If the creature can understand you, it must succeed on a Wisdom saving throw or become charmed by you for the duration. While the creature is charmed by you, it takes 5d10 psychic damage each time it acts in a manner directly counter to your instructions, but no more than once each day. A creature that can't understand you is unaffected by the spell.

You can issue any command you choose, short of an activity that would result in certain death. Should you issue a suicidal command, the spell ends.

You can end the spell early by using an action to dismiss it. A remove curse, greater restoration, or wish spell also ends it.

At Higher Levels: When you cast this spell using a spell slot of 7th or 8th level, the duration is 1 year. When you cast this spell using a spell slot of 9th level, the spell lasts until it is ended by one of the spells mentioned above.",
  school: 'enchantment',
  range: '60 feet',
  components: ['V'],
  duration: '30 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 152,
)

Spell.create(
  name: "Gentle Repose",
  level: 2,
  description: "You touch a corpse or other remains. For the duration, the target is protected from decay and can't become undead.

The spell also effectively extends the time limit on raising the target from the dead, since days spent under the influence of this spell don't count against the time limit of spells such as raise dead.",
  school: 'necromancy',
  ritual: 1,
  range: 'Touch',
  components: ['V','S','M (A pinch of salt and one copper piece placed on each of the corpse’s eyes, which must remain there for the duration)'],
  duration: '10 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 153,
)

Spell.create(
  name: "Giant Insect",
  level: 4,
  description: "You transform up to ten centipedes, three spiders, five wasps, or one scorpion within range into giant versions of their natural forms for the duration. A centipede becomes a giant centipede, a spider becomes a giant spider, a wasp becomes a giant wasp, and a scorpion becomes a giant scorpion.

Each creature obeys your verbal commands, and in combat, they act on your turn each round. The DM has the statistics for these creatures and resolves their actions and movement.

A creature remains in its giant size for the duration, until it drops to 0 hit points, or until you use an action to dismiss the effect on it.",
  school: 'transmutation',
  range: '30 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 154,
)

Spell.create(
  name: "Glibness",
  level: 8,
  description: "Until the spell ends, when you make a Charisma check, you can replace the number you roll with a 15. Additionally, no matter what you say, magic that would determine if you are telling the truth indicates that you are being truthful.",
  school: 'transmutation',
  components: ['V'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 155,
)

Spell.create(
  name: "Globe of Invulnerability",
  level: 6,
  description: "An immobile, faintly shimmering barrier springs into existence in a 10-foot radius around you and remains for the duration.

Any spell of 5th level or lower cast from outside the barrier can't affect creatures or objects within it, even if the spell is cast using a higher level spell slot. Such a spell can target creatures and objects within the barrier, but the spell has no effect on them. Similarly, the area within the barrier is excluded from the areas affected by such spells.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, the barrier blocks spells of one level higher for each slot level above 6th.",
  school: 'abjuration',
  range: 'Self (10-foot radius)',
  components: ['V','S','M (a glass or crystal bead that shatters when the spell ends)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 156,
)

Spell.create(
  name: "Glyph of Warding",
  level: 3,
  description: "When you cast this spell, you inscribe a glyph that harms other creatures, either upon a surface (such as a table or a section of floor or wall) or within an object that can be closed (such as a book, a scroll, or a treasure chest) to conceal the glyph. If you choose a surface, the glyph can cover an area of the surface no larger than 10 feet in diameter. If you choose an object, that object must remain in its place, if the object is moved more than 10 feet from where you cast this spell, the glyph is broken and the spell ends without being triggered.

The glyph is nearly invisible and requires a successful Intelligence (Investigation) check against your spell save DC to be found.

You decide what triggers the glyph when you cast the spell. For glyphs inscribed on a surface, the most typical triggers include touching or standing on the glyph, removing another object covering the glyph, approaching within a certain distance of the glyph, or manipulating the object on which the glyph is inscribed. For glyphs inscribed within an object, the most common triggers include opening that object, approaching within a certain distance of the object, or seeing or reading the glyph. Once a glyph is triggered, this spell ends.

You can further refine the trigger so the spell activates only under certain circumstances or according to physical characteristics (such as height or weight), creature kind (for example, the ward could be set to affect aberrations or drow), or alignment. You can also set conditions for creatures that don't trigger the glyph, such as those who say a certain password.

When you inscribe the glyph, choose explosive runes or a spell glyph.

Explosive Runes: When triggered, the glyph erupts with magical energy in a 20-foot-radius sphere centered on the glyph. The sphere spreads around corners. Each creature in the aura must make a Dexterity saving throw. A creature takes 5d8 acid, cold, fire, lightning, or thunder damage on a failed saving throw (your choice when you create the glyph), or half as much damage on a successful one.

Spell Glyph: You can store a prepared spell of 3rd level or lower in the glyph by casting it as part of creating the glyph. The spell must target a single creature or an area. The spell being stored has no immediate effect when cast in this way. When the glyph is triggered, the stored spell is cast. If the spell has a target, it targets the creature that triggered the glyph. If the spell affects an area, the area is centered on that creature. If the spell summons hostile creatures or creates harmful objects or traps, they appear as close as possible to the intruder and attack it. If the spell requires concentration, it lasts until the end of its full duration.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the damage of an explosive runes glyph increases by 1d8 for each slot level above 3rd. If you create a spell glyph, you can store any spell of up to the same level as the slot you use for the glyph of warding.",
  school: 'abjuration',
  range: 'Touch',
  cast_time: '1 hour',
  components: ['V','S','M (incense and powdered diamond worth at least 200 gp, which the spell consumes)'],
  duration: 'Until dispelled or triggered',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 157,
)

Spell.create(
  name: "Goodberry",
  level: 1,
  description: "Up to ten berries appear in your hand and are infused with magic for the duration. A creature can use its action to eat one berry. Eating a berry restores 1 hit point, and the berry provides enough nourishment to sustain a creature for one day.

The berries lose their potency if they have not been consumed within 24 hours of the casting of this spell.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (a sprig of mistletoe)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 158,
)

Spell.create(
  name: "Grasping Vine",
  level: 4,
  description: "You conjure a vine that sprouts from the ground in an unoccupied space of your choice that you can see within range. When you cast this spell, you can direct the vine to lash out at a creature within 30 feet of it that you can see. That creature must succeed on a Dexterity saving throw or be pulled 20 feet directly toward the vine.

Until the spell ends, you can direct the vine to lash out at the same creature or another one as a bonus action on each of your turns.",
  school: 'conjuration',
  cast_time: '1 bonus action',
  range: '30 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 159,
)

Spell.create(
  name: "Grease",
  level: 1,
  description: "Slick grease covers the ground in a 10-foot square centered on a point within range and turns it into difficult terrain for the duration.

When the grease appears, each creature standing in its area must succeed on a Dexterity saving throw or fall prone. A creature that enters the area or ends its turn there must also succeed on a Dexterity saving throw or fall prone.",
  school: 'conjuration',
  range: '60 feet',
  components: ['V','S','M (a bit of pork rind or butter)'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 160,
)

Spell.create(
  name: "Greater Invisibility",
  level: 4,
  description: "You or a creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the target's person.",
  school: 'illusion',
  range: 'Touch',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 161,
)

Spell.create(
  name: "Greater Restoration",
  level: 5,
  description: "You imbue a creature you touch with positive energy to undo a debilitating effect. You can reduce the target's exhaustion level by one, or end one of the following effects on the target.

• One effect that charmed or petrified the target

• One curse, including the target's attunement to a cursed magic item

• Any reduction to one of the target's ability scores

• One effect reducing the target's hit point maximum",
  school: 'abjuration',
  range: 'Toush',
  components: ['V','S','M (diamond dust worth at least 100 gp, which the spell consumes)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 162,
)

Spell.create(
  name: "Guardian of Faith",
  level: 4,
  description: "A Large spectral guardian appears and hovers for the duration in an unoccupied space of your choice that you can see within range. The guardian occupies that space and is indistinct except for a gleaming sword and shield emblazoned with the symbol of your deity.

Any creature hostile to you that moves to a space within 10 feet of the guardian for the first time on a turn must succeed on a Dexterity saving throw. The creature takes 20 radiant damage on a failed save, or half as much damage on a successful one. The guardian vanishes when it has dealt a total of 60 damage.",
  school: 'conjuration',
  range: '30 feet',
  components: ['V'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 163,
)

Spell.create(
  name: "Guards and Wards",
  level: 6,
  description: "You create a ward that protects up to 2,500 square feet of floor space (an area 50 feet square, or one hundred 5-foot squares or twenty-five 10-foot squares). The warded area can be up to 20 feet tall, and shaped as you desire. You can ward several stories of a stronghold by dividing the area among them, as long as you can walk into each contiguous area while you are casting the spell.

When you cast this spell, you can specify individuals that are unaffected by any or all of the effects that you choose. You can also specify a password that, when spoken aloud, makes the speaker immune to these effects.

Guards and wards creates the following effects within the warded area.

Corridors: Fog fills all the warded corridors, making them heavily obscured. In addition, at each intersection or branching passage offering a choice of direction, there is a 50 percent chance that a creature other than you will believe it is going in the opposite direction from the one it chooses.

Doors: All doors in the warded area are magically locked, as if sealed by an arcane lock spell. In addition, you can cover up to ten doors with an illusion (equivalent to the illusory object function of the minor illusion spell) to make them appear as plain sections of wall.

Stairs: Webs fill all stairs in the warded area from top to bottom, as the web spell. These strands regrow in 10 minutes if they are burned or torn away while guards and wards lasts.

Other Spell Effect: You can place your choice of one of the following magical effects within the warded area of the stronghold.

• Place dancing lights in four corridors. You can designate a simple program that the lights repeat as long as guards and wards lasts.

• Place magic mouth in two locations.

• Place stinking cloud in two locations. The vapors appear in the places you designate they return within 10 minutes if dispersed by wind while guards and wards lasts.

• Place a constant gust of wind in one corridor or room.

• Place a suggestion in one location. You select an area of up to 5 feet square, and any creature that enters or passes through the area receives the suggestion mentally.

The whole warded area radiates magic. A dispel magic cast on a specific effect, if successful, removes only that effect.

You can create a permanently guarded and warded structure by casting this spell there every day for one year.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S','M (Burning incense, a small measure of brimstone and oil, a knotted string, a small amount of umber hulk blood, and a small silver rod worth at least 10 gp)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 164,
)

Spell.create(
  name: "Guidance",
  level: 0,
  description: "You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one ability check of its choice. It can roll the die before or after making the ability check. The spell then ends.",
  school: 'divination',
  range: 'Touch',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 165,
)

Spell.create(
  name: "Guiding Bolt",
  level: 1,
  description: "A flash of light streaks toward a creature of your choice within range. Make a ranged spell attack against the target. On a hit, the target takes 4d6 radiant damage, and the next attack roll made against this target before the end of your next turn has advantage, thanks to the mystical dim light glittering on the target until then.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.",
  school: 'evocation',
  range: '120 feet',
  duration: '1 round',
  attack: 'true',
  atk_dmg: {
    1=> '4d6',
  },
  dmg_type: 'Radiant',
  id: 166,
)

Spell.create(
  name: "Gust of Wind",
  level: 2,
  description: "A line of strong wind 60 feet long and 10 feet wide blasts from you in a direction you choose for the spell's duration. Each creature that starts its turn in the line must succeed on a Strength saving throw or be pushed 15 feet away from you in a direction following the line.

Any creature in the line must spend 2 feet of movement for every 1 foot it moves when moving closer to you.

The gust disperses gas or vapor, and it extinguishes candles, torches, and similar unprotected flames in the area. It causes protected flames, such as those of lanterns, to dance wildly and has a 50 percent chance to extinguish them.

As a bonus action on each of your turns before the spell ends, you can change the direction in which the line blasts from you.",
  school: 'evocation',
  range: 'Self (60-foot line)',
  components: ['V','S','M (a legume seed)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 167,
)

Spell.create(
  name: "Hail of Thorns",
  level: 1,
  description: "The next time you hit a creature with a ranged weapon attack before the spell ends, this spell creates a rain of thorns that sprouts from your ranged weapon or ammunition. In addition to the normal effect of the attack, the target of the attack and each creature within 5 feet of it must make a Dexterity saving throw. A creature takes 1d10 piercing damage on a failed save, or half as much damage on a successful one.

At Higher Levels. If you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d10 for each slot level above 1st (to a maximum of 6d10).",
  school: 'conjuration',
  cast_time: '1 bonus action',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '1d10',
  },
  dmg_type: 'Piercing',
  id: 168,
)

Spell.create(
  name: "Hallow",
  level: 5,
  description: "You touch a point and infuse an area around it with holy (or unholy) power. The area can have a radius up to 60 feet, and the spell fails if the radius includes an area already under the effect a hallow spell. The affected area is subject to the following effects.

First, celestials, elementals, fey, fiends, and undead can't enter the area, nor can such creatures charm, frighten, or possess creatures within it. Any creature charmed, frightened, or possessed by such a creature is no longer charmed, frightened, or possessed upon entering the area. You can exclude one or more of those types of creatures from this effect.

Second, you can bind an extra effect to the area. Choose the effect from the following list, or choose an effect offered by the DM. Some of these effects apply to creatures in the area, you can designate whether the effect applies to all creatures, creatures that follow a specific deity or leader, or creatures of a specific sort, such as orcs or trolls. When a creature that would be affected enters the spell's area for the first time on a turn or starts its turn there, it can make a Charisma saving throw. On a success, the creature ignores the extra effect until it leaves the area.

Courage: Affected creatures can't be frightened while in the area.

Darkness: Darkness fills the area. Normal light, as well as magical light created by spells of a lower level than the slot you used to cast this spell, can't illuminate the area.

Daylight: Bright light fills the area. Magical darkness created by spells of a lower level than the slot you used to cast this spell can't extinguish the light.

Energy Protection: Affected creatures in the area have resistance to one damage type of your choice, except for bludgeoning, piercing, or slashing.

Energy Vulnerability: Affected creatures in the area have vulnerability to one damage type of your choice, except for bludgeoning, piercing, or slashing.

Everlasting Rest: Dead bodies interred in the area can't be turned into undead.

Extradimensional Interference: Affected creatures can't move or travel using teleportation or by extradimensional or interplanar means.

Fear: Affected creatures are frightened while in the area.

Silence: No sound can emanate from within the area, and no sound can reach into it.

Tongues: Affected creatures can communicate with any other creature in the area, even if they don't share a common language.",
  school: 'evocation',
  range: 'Touch',
  components: ['V','S','M (herbs, oils, and incense worth at least 1,000 gp, which the spell consumes)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 169,
)

Spell.create(
  name: "Hallucinatory Terrain",
  level: 4,
  description: "You make natural terrain in a 150-foot cube in range look, sound, and smell like some other sort of natural terrain. Thus, open fields or a road can be made to resemble a swamp, hill, crevasse, or some other difficult or impassable terrain. A pond can be made to seem like a grassy meadow, a precipice like a gentle slope, or a rock-strewn gully like a wide and smooth road. Manufactured structures, equipment, and creatures within the area aren't changed in appearance.

The tactile characteristics of the terrain are unchanged, so creatures entering the area are likely to see through the illusion. If the difference isn't obvious by touch, a creature carefully examining the illusion can attempt an Intelligence (Investigation) check against your spell save DC to disbelieve it. A creature who discerns the illusion for what it is, sees it as a vague image superimposed on the terrain.",
  school: 'illusion',
  cast_time: '10 minutes',
  range: '300 feet',
  components: ['V','S','M (a stone, a twig, and a bit of green plant)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 170,
)

Spell.create(
  name: "Harm",
  level: 6,
  description: "You unleash a virulent disease on a creature that you can see within range. The target must make a Constitution saving throw. On a failed save, it takes 14d6 necrotic damage, or half as much damage on a successful save. The damage can't reduce the target's hit points below 1. If the target fails the saving throw, its hit point maximum is reduced for 1 hour by an amount equal to the necrotic damage it took. Any effect that removes a disease allows a creature's hit point maximum to return to normal before that time passes.",
  school: 'necromancy',
  range: '60 feet',
  attack: 'true',
  atk_dmg: {
    1=> '14d6',
  },
  dmg_type: 'Necrotic',
  id: 171,
)

Spell.create(
  name: "Haste",
  level: 3,
  description: "Choose a willing creature that you can see within range. Until the spell ends, the target's speed is doubled, it gains a +2 bonus to AC, it has advantage on Dexterity saving throws, and it gains an additional action on each of its turns. That action can be used only to take the Attack (one weapon attack only), Dash, Disengage, Hide, or Use an Object action.

When the spell ends, the target can't move or take actions until after its next turn, as a wave of lethargy sweeps over it.",
  school: 'transmutation',
  range: '30 feet',
  components: ['V','S','M (a shaving of licorice root)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 172,
)

Spell.create(
  name: "Heal",
  level: 3,
  description: "Choose a creature that you can see within range. A surge of positive energy washes through the creature, causing it to regain 70 hit points. The spell also ends blindness, deafness, and any diseases affecting the target. This spell has no effect on constructs or undead.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, the amount of healing increases by 10 for each slot level above 6th.",
  school: 'transmutation',
  range: '60 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 173,
)

Spell.create(
  name: "Healing Word",
  level: 1,
  description: "A creature of your choice that you can see within range regains hit points equal to 1d4 + your spellcasting ability modifier. This spell has no effect on undead or constructs.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the healing increases by 1d4 for each slot level above 1st.",
  school: 'evocation',
  cast_time: '1 bonus action',
  range: '60 feet',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 174,
)

Spell.create(
  name: "Heat Metal",
  level: 2,
  description: "Choose a manufactured metal object, such as a metal weapon or a suit of heavy or medium metal armor, that you can see within range. You cause the object to glow red-hot. Any creature in physical contact with the object takes 2d8 fire damage when you cast the spell. Until the spell ends, you can use a bonus action on each of your subsequent turns to cause this damage again.

If a creature is holding or wearing the object and takes the damage from it, the creature must succeed on a Constitution saving throw or drop the object if it can. If it doesn't drop the object, it has disadvantage on attack rolls and ability checks until the start of your next turn.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 1d8 for each slot above 2nd.",
  school: 'transmutation',
  range: '60 feet',
  components: ['V','S','M (a piece of iron and flame)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '2d8',
  },
  dmg_type: '',
  id: 175,
)

Spell.create(
  name: "Hellish Rebuke",
  level: 1,
  description: "You point your finger, and the creature that damaged you is momentarily surrounded by hellish flames. The creature must make a Dexterity saving throw. It takes 2d10 fire damage on a failed save, or half as much damage on a successful one.

At Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d10 for each slot level above 1st.",
  school: 'evocation',
  cast_time: '1 reaction',
  range: '60 feet',
  attack: 'true',
  atk_dmg: {
    1=> '2d10',
  },
  dmg_type: 'Fire',
  id: 176,
)

Spell.create(
  name: "Heroes' Feast",
  level: 6,
  description: "You bring forth a great feast, including magnificent food and drink. The feast takes 1 hour to consume and disappears at the end of that time, and the beneficial effects don't set in until this hour is over. Up to twelve other creatures can partake of the feast.

A creature that partakes of the feast gains several benefits. The creature is cured of all diseases and poison, becomes immune to poison and being frightened, and makes all Wisdom saving throws with advantage. Its hit point maximum also increases by 2d10, and it gains the same number of hit points. These benefits last for 24 hours.",
  school: 'conjuration',
  range: '30 feet',
  cast_time: '30 minutes',
  components: ['V','S','M (a gem-encrusted bowl worth at least 1,000 gp, which the spell consumes)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 177,
)

Spell.create(
  name: "Heroism",
  level: 1,
  description: "A willing creature you touch is imbued with bravery. Until the spell ends, the creature is immune to being frightened and gains temporary hit points equal to your spellcasting ability modifier at the start of each of its turns. When the spell ends, the target loses any remaining temporary hit points from this spell.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.",
  school: 'enchantment',
  range: 'Touch',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 178,
)

Spell.create(
  name: "Hex",
  level: 1,
  description: "You place a curse on a creature that you can see within range. Until the spell ends, you deal an extra 1d6 necrotic damage to the target whenever you hit it with an attack. Also, choose one ability when you cast the spell. The target has disadvantage on ability checks made with the chosen ability.

If the target drops to 0 hit points before this spell ends, you can use a bonus action on a subsequent turn of yours to curse a new creature.

A Remove Curse cast on the target ends this spell early.

At Higher Levels. When you cast this spell using a spell slot of 3rd or 4th level, you can maintain your concentration on the spell for up to 8 hours. When you use a spell slot of 5th level or higher, you can maintain your concentration on the spell for up to 24 hours.",
  school: 'enchantment',
  range: '90 feet',
  cast_time: '1 bonus action',
  components: ['V','S','M (the petrified eye of a newt)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 179,
)

Spell.create(
  name: "Hold Monster",
  level: 5,
  description: "Choose a creature that you can see within range. The target must succeed on a Wisdom saving throw or be paralyzed for the duration. This spell has no effect on undead. At the end of each of its turns, the target can make another Wisdom saving throw. On a success, the spell ends on the target.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, you can target on additional creature for each slot level above 5th. The creatures must be within 30 feet of each other when you target them.",
  school: 'enchantment',
  range: '90 feet',
  components: ['V','S','M (a small, straight piece of iron)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 180,
)

Spell.create(
  name: "Hold Person",
  level: 2,
  description: "Choose a humanoid that you can see within range. The target must succeed on a Wisdom saving throw or be paralyzed for the duration. At the end of each of its turns, the target can make another Wisdom saving throw. On a success, the spell ends on the target.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, you can target on additional humanoid for each slot level above 2nd. The humanoids must be within 30 feet of each other when you target them.",
  school: 'enchantment',
  range: '60 feet',
  components: ['V','S','M (a small, straight piece of iron)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 181,
)

Spell.create(
  name: "Holy Aura",
  level: 8,
  description: "Divine light washes out from you and coalesces in a soft radiance in a 30-foot radius around you. Creatures of your choice in that radius when you cast this spell shed dim light in a 5-foot radius and have advantage on all saving throws, and other creatures have disadvantage on attack rolls against them until the spell ends. In addition, when a fiend or an undead hits an affected creature with a melee attack, the aura flashes with brilliant light. The attacker must succeed on a Constitution saving throw or be blinded until the spell ends.",
  school: 'abjuration',
  components: ['V','S','M (a tiny reliquary worth at least 1,000 gp containing a sacred relic, such as a scrap of cloth from a saint’s robe or a piece of parchment from a religious text)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 182,
)

Spell.create(
  name: "Hunger of Hadar",
  level: 3,
  description: "You open a gateway to the dark between the stars, a region infested with unknown horrors. A 20-foot-radius sphere of blackness and bitter cold appears, centered on a point with range and lasting for the duration. This void is filled with a cacophony of soft whispers and slurping noises that can be heard up to 30 feet away. No light, magical or otherwise, can illuminate the area, and creatures fully within the area are blinded.

The void creates a warp in the fabric of space, and the area is difficult terrain. Any creature that starts its turn in the area takes 2d6 cold damage. Any creature that ends its turn in the area must succeed on a Dexterity saving throw or take 2d6 acid damage as milky, otherwordly tentacles rub against it.",
  school: 'conjuration',
  range: '150 feet',
  components: ['V','S','M (a pickled octopus tentacle)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '2d6',
  },
  dmg_type: 'Mixed',
  id: 183,
)

Spell.create(
  name: "Hunter's Mark",
  level: 1,
  description: "You choose a creature you can see within range and mystically mark it as your quarry. Until the spell ends, you deal an extra 1d6 damage to the target whenever you hit it with a weapon attack, and you have advantage on any Wisdom (Perception) or Wisdom (Survival) check you make to find it. If the target drops to 0 hit points before this spell ends, you can use a bonus action on a subsequent turn of yours to mark a new creature.

At Higher Levels: When you cast this spell using a spell slot of 3rd or 4th level, you can maintain your concentration on the spell for up to 8 hours. When you use a spell slot of 5th level or higher, you can maintain your concentration on the spell for up to 24 hours.",
  school: 'divination',
  cast_time: '1 bonus action',
  range: '90 feet',
  components: ['V'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 184,
)

Spell.create(
  name: "Hypnotic Pattern",
  level: 2,
  description: "You create a twisting pattern of colors that weaves through the air inside a 30-foot cube within range. The pattern appears for a moment and vanishes. Each creature in the area who sees the pattern must make a Wisdom saving throw. On a failed save, the creature becomes charmed for the duration. While charmed by this spell, the creature is incapacitated and has a speed of 0.

The spell ends for an affected creature if it takes any damage or if someone else uses an action to shake the creature out of its stupor.",
  school: 'illusion',
  range: '120 feet',
  components: ['S','M (a glowing stick of incense or a crystal vial filled with phosphorescent material)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 185,
)

Spell.create(
  name: "Ice Storm",
  level: 4,
  description: "A hail of rock-hard ice pounds to the ground in a 20-foot-radius, 40-foot-high cylinder centered on a point within range. Each creature in the cylinder must make a Dexterity saving throw. A creature takes 2d8 bludgeoning damage and 4d6 cold damage on a failed save, or half as much damage on a successful one.

Hailstones turn the storm's area of effect into difficult terrain until the end of your next turn.

At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, the bludgeoning damage increases by 1d8 for each slot level above 4th.",
  school: 'evocation',
  range: '300 feet',
  components: ['V','S','M (a pinch of dust and a few drops of water)'],
  attack: 'true',
  atk_dmg: {
    1=> '4d6',
  },
  dmg_type: 'Cold',
  id: 186,
)

Spell.create(
  name: "Identify",
  level: 1,
  description: "You choose one object that you must touch throughout the casting of the spell. If it is a magic item or some other magic-imbued object, you learn its properties and how to use them, whether it requires attunement to use, and how many charges it has, if any. You learn whether any spells are affecting the item and what they are. If the item was created by a spell, you learn which spell created it.

If you instead touch a creature throughout the casting, you learn what spells, if any, are currently affecting it.",
  school: 'divination',
  ritual: 1,
  range: 'Touch',
  cast_time: '1 minute',
  components: ['V','S','M (a pearl worth at least 100 gp and an owl feather)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 187,
)

Spell.create(
  name: "Illusory Script",
  level: 1,
  description: "You write on parchment, paper, or some other suitable writing material and imbue it with a potent illusion that lasts for the duration.

To you and any creatures you designate when you cast the spell, the writing appears normal, written in your hand, and conveys whatever meaning you intended when you wrote the text. To all others, the writing appears as if it were written in an unknown or magical script that is unintelligible. Alternatively, you can cause the writing to appear to be an entirely different message, written in a different hand and language, though the language must be one you know.

Should the spell be dispelled, the original script and the illusion both disappear.

A creature with truesight can read the hidden message.",
  school: 'illusion',
  cast_time: '1 minute',
  range: 'Touch',
  ritual: 1,
  components: ['S','M (a lead-based ink worth at least 10 gp, which the spell consumes)'],
  duration: '10 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 188,
)

Spell.create(
  name: "Imprisonment",
  level: 9,
  description: "You create a magical restraint to hold a creature that you can see within range. The target must succeed on a Wisdom saving throw or be bound by the spell, if it succeeds, it is immune to this spell if you cast it again. While affected by this spell, the creature doesn't need to breathe, eat, or drink, and it doesn't age. Divination spells can't locate or perceive the target.

When you cast the spell, you choose one of the following forms of imprisonment.

Burial: The target is entombed far beneath the earth in a sphere of magical force that is just large enough to contain the target. Nothing can pass through the sphere, nor can any creature teleport or use planar travel to get into or out of it.

The special component for this version of the spell is a small mithral orb.

Chaining: Heavy chains, firmly rooted in the ground, hold the target in place. The target is restrained until the spell ends, and it can't move or be moved by any means until then.

The special component for this version of the spell is a fine chain of precious metal.

Hedged Prison: The spell transports the target into a tiny demiplane that is warded against teleportation and planar travel. The demiplane can be a labyrinth, a cage, a tower, or any similar confined structure or area of your choice.

The special component for this version of the spell is a miniature representation of the prison made from jade.

Minimus Containment: The target shrinks to a height of 1 inch and is imprisoned inside a gemstone or similar object. Light can pass through the gemstone normally (allowing the target to see out and other creatures to see in), but nothing else can pass through, even by means of teleportation or planar travel. The gemstone can't be cut or broken while the spell remains in effect.

The special component for this version of the spell is a large, transparent gemstone, such as a corundum, diamond, or ruby.

Slumber: The target falls asleep and can't be awoken.

The special component for this version of the spell consists of rare soporific herbs.

Ending the Spell: During the casting of the spell, in any of its versions, you can specify a condition that will cause the spell to end and release the target. The condition can be as specific or as elaborate as you choose, but the DM must agree that the condition is reasonable and has a likelihood of coming to pass. The conditions can be based on a creature's name, identity, or deity but otherwise must be based on observable actions or qualities and not based on intangibles such as level, class, or hit points.

A dispel magic spell can end the spell only if it is cast as a 9th-level spell, targeting either the prison or the special component used to create it.

You can use a particular special component to create only one prison at a time. If you cast the spell again using the same component, the target of the first casting is immediately freed from its binding.",
  school: 'abjuration',
  range: '30 feet',
  cast_time: '1 minute',
  components: ['V','S','M (a vellum depiction or a carved statuette in the likeness of the target, and a special component that varies according to the version of the spell you choose, worth at least 500 gp per Hit Die of the target)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 189,
)

Spell.create(
  name: "Incendiary Cloud",
  level: 8,
  description: "A swirling cloud of smoke shot through with white-hot embers appears in a 20-foot-radius sphere centered on a point within range. The cloud spreads around corners and is heavily obscured. It lasts for the duration or until a wind of moderate or greater speed (at least 10 miles per hour) disperses it.

When the cloud appears, each creature in it must make a Dexterity saving throw. A creature takes 10d8 fire damage on a failed save, or half as much damage on a successful one. A creature must also make this saving throw when it enters the spell's area for the first time on a turn or ends its turn there.

The cloud moves 10 feet directly away from you in a direction that you choose at the start of each of your turns.",
  school: 'conjuration',
  range: '150 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '10d8',
  },
  dmg_type: 'Fire',
  id: 190,
)

Spell.create(
  name: "Inflict Wounds",
  level: 1,
  description: "Make a melee spell attack against a creature you can reach. On a hit, the target takes 3d10 necrotic damage.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d10 for each slot level above 1st.",
  school: 'necromancy',
  range: 'Touch',
  attack: 'true',
  atk_dmg: {
    1=> '3d10',
  },
  dmg_type: 'Necrotic',
  id: 191,
)

Spell.create(
  name: "Insect Plague",
  level: 5,
  description: "Swarming, biting locusts fill a 20-foot-radius sphere centered on a point you choose within range. The sphere spreads around corners. The sphere remains for the duration, and its area is lightly obscured. The sphere's area is difficult terrain.

When the area appears, each creature in it must make a Constitution saving throw. A creature takes 4d10 piercing damage on a failed save, or half as much damage on a successful one. A creature must also make this saving throw when it enters the spell's area for the first time on a turn or ends its turn there.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the damage increases by 1d10 for each slot level above 5th.",
  school: 'conjuration',
  range: '300 feet',
  components: ['V','S','M (a few grains of sugar, some kernels of grain, and a smear of fat)'],
  duration: 'Concentration, up to1 0 minutes',
  attack: 'true',
  atk_dmg: {
    1=> '4d10',
  },
  dmg_type: 'Piercing',
  id: 192,
)

Spell.create(
  name: "Invisibility",
  level: 2,
  description: "A creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the target's person. The spell ends for a target that attacks or casts a spell.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, you can target one additional creature for each slot level above 2nd.",
  school: 'illusion',
  range: 'Touch',
  components: ['V','S','M (an eyelash encased in gum arabic)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 193,
)

Spell.create(
  name: "Jump",
  level: 1,
  description: "You touch a creature. The creature's jump distance is tripled until the spell ends.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S',"M (a grasshopper's hind leg)"],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 194,
)

Spell.create(
  name: "Knock",
  level: 2,
  description: "Choose an object that you can see within range. The object can be a door, a box, a chest, a set of manacles, a padlock, or another object that contains a mundane or magical means that prevents access.

A target that is held shut by a mundane lock or that is stuck or barred becomes unlocked, unstuck, or unbarred. If the object has multiple locks, only one of them is unlocked.

If you choose a target that is held shut with arcane lock, that spell is suppressed for 10 minutes, during which time the target can be opened and shut normally.

When you cast the spell, a loud knock, audible from as far away as 300 feet, emanates from the target object.",
  school: 'transmutation',
  range: '60 feet',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 195,
)

Spell.create(
  name: "Legend Lore",
  level: 5,
  description: "Name or describe a person, place, or object. The spell brings to your mind a brief summary of the significant lore about the thing you named. The lore might consist of current tales, forgotten stories, or even secret lore that has never been widely known. If the thing you named isn't of legendary importance, you gain no information.

The more information you already have about the thing, the more precise and detailed the information you receive is. The information you learn is accurate but might be couched in figurative language. For example, if you have a mysterious magic axe on hand, the spell might yield this information - Woe to the evildoer whose hand touches the axe, for even the haft slices the hand of the evil ones. Only a true Child of Stone, lover and beloved of Moradin, may awaken the true powers of the axe, and only with the sacred word Rudnogg on the lips.",
  school: 'divination',
  cast_time: '10 minutes',
  components: ['V','S','M (incense worth at least 250 gp, which the spell consumes, and four ivory strips worth at least 50 gp each)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 196,
)

Spell.create(
  name: "Leomund's Secret Chest",
  level: 4,
  description: "You hide a chest, and all its contents, on the Ethereal Plane. You must touch the chest and the miniature replica that serves as a material component for the spell. The chest can contain up to 12 cubic feet of nonliving material (3 feet by 2 feet by 2 feet).

While the chest remains on the Ethereal Plane, you can use an action and touch the replica to recall the chest. It appears in an unoccupied space on the ground within 5 feet of you. You can send the chest back to the Ethereal Plane by using an action and touching both the chest and the replica.

After 60 days, there is a cumulative 5 percent chance per day that the spell's effect ends. This effect ends if you cast this spell again, if the smaller replica chest is destroyed, or if you choose to end the spell as an action. If the spell ends and the larger chest is on the Ethereal Plane, it is irretrievably lost.",
  school: 'conjuration',
  range: 'Touch',
  components: ['V','S','M (an exquisite chest, 3 feet by 2 feet by 2 feet, constructed from rare materials worth at least 5,000 gp, and a Tiny replica made from the same materials worth at least 50 gp)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 197,
)

Spell.create(
  name: "Leomund's Tiny Hut",
  level: 3,
  description: "A 10-foot-radius immobile dome of force springs into existence around and above you and remains stationary for the duration. The spell ends if you leave its area.

Nine creatures of Medium size or smaller can fit inside the dome with you. The spell fails if its area includes a larger creature or more than nine creatures. Creatures and objects⁠ within the dome when you cast this spell can move through it freely. All other creatures and objects⁠ are barred from passing through it. Spells and other magical effects can't extend through the dome or be cast through it. The atmosphere inside the space is comfortable and dry, regardless of the weather outside.

Until the spell ends, you can command⁠ the interior to become dimly lit or dark. The dome is opaque from the outside, of any color you choose, but it is transparent from the inside.",
  school: 'evocation',
  ritual: 1,
  range: 'Self(10-foot radius hemisphere)',
  components: ['V','S','M (a small crystal bead)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 198,
)

Spell.create(
  name: "Lesser Restoration",
  level: 2,
  description: "You touch a creature and can end either one disease or one condition afflicting it. The condition can be blinded, deafened, paralyzed, or poisoned.",
  school: 'abjuration',
  cast_time: '1 minute',
  range: 'Touch',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 199,
)

Spell.create(
  name: "Levitate",
  level: 2,
  description: "One creature or object of your choice that you can see within range rises vertically, up to 20 feet, and remains suspended there for the duration. The spell can levitate a target that weighs up to 500 pounds. An unwilling creature that succeeds on a Constitution saving throw is unaffected.

The target can move only by pushing or pulling against a fixed object or surface within reach (such as a wall or a ceiling), which allows it to move as if it were climbing. You can change the target's altitude by up to 20 feet in either direction on your turn. If you are the target, you can move up or down as part of your move. Otherwise, you can use your action to move the target, which must remain within the spell's range.

When the spell ends, the target floats gently to the ground if it is still aloft.",
  school: 'transmutation',
  range: '60 feet',
  components: ['V','S','M (either a small leather loop or a piece of golden wire bent into a cup shape with a long shank on one end)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 200,
)

Spell.create(
  name: "Light",
  level: 0,
  description: "You touch one object that is no larger than 10 feet in any dimension. Until the spell ends, the object sheds bright light in a 20-foot radius and dim light for an additional 20 feet. The light can be colored as you like. Completely covering the object with something opaque blocks the light. The spell ends if you cast it again or dismiss it as an action.

If you target an object held or worn by a hostile creature, that creature must succeed on a Dexterity saving throw to avoid the spell.",
  school: 'evocation',
  range: 'Touch',
  components: ['V','M (a firefly or phosphorescent moss)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 201,
)

Spell.create(
  name: "Lightning Arrow",
  level: 3,
  description: "The next time you make a ranged weapon attack during the spell’s duration, the weapon’s ammunition, or the weapon itself if it’s a thrown weapon, transforms into a bolt of lightning. Make the attack roll as normal. The target takes 4d8 lightning damage on a hit, or half as much damage on a miss, instead of the weapon’s normal damage.

Whether you hit or miss, each creature within 10 feet of the target must make a Dexterity saving throw. Each of these creatures takes 2d8 lightning damage on a failed save, or half as much damage on a successful one.

The piece of ammunition or weapon then returns to its normal form.

At Higher Levels. When you cast this spell using a spell slot of 4th level or higher, the damage for both effects of the spell increases by 1d8 for each slot level above 3rd.",
  school: 'transmutation',
  cast_time: '1 bonus action',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 202,
)

Spell.create(
  name: "Lightning Bolt",
  level: 3,
  description: "A stroke of lightning forming a line of 100 feet long and 5 feet wide blasts out from you in a direction you choose. Each creature in the line must make a Dexterity saving throw. A creature takes 8d6 lightning damage on a failed save, or half as much damage on a successful one.

The lightning ignites flammable objects in the area that aren't being worn or carried.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d6 for each slot above 3rd.",
  school: 'evocation',
  range: 'Self (100-foot line)',
  components: ['V','S','M (a but of fur and a rod of amber, crystal, or glass)'],
  attack: 'true',
  atk_dmg: {
    1=> '8d6',
  },
  dmg_type: 'Lightning',
  id: 203,
)

Spell.create(
  name: "Locate Animals or Plants",
  level: 2,
  description: "Describe or name a specific kind of beast or plant. Concentrating on the voice of nature in your surroundings, you learn the direction and distance to the closest creature or plant of that kind within 5 miles, if any are present.",
  school: 'divination',
  ritual: 1,
  components: ['V','S','M (a bit of fur from a bloodhound)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 204,
)

Spell.create(
  name: "Locate Creature",
  level: 4,
  description: "Describe or name a creature that is familiar to you. You sense the direction to the creature's location, as long as that creature is within 1,000 feet of you. If the creature is moving, you know the direction of its movement.

The spell can locate a specific creature known to you, or the nearest creature of a specific kind (such as a human or a unicorn), so long as you have seen such a creature up close - within 30 feet - at least once. If the creature you described or named is in a different form, such as being under the effects of a polymorph spell, this spell doesn't locate the creature.

This spell can't locate a creature if running water at least 10 feet wide blocks a direct path between you and the creature.",
  school: 'divination',
  duration: 'Concentration, up to 1 hour',
  components: ['V','S','M (a bit of fur from a bloodhound)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 205,
)

Spell.create(
  name: "Locate Object",
  level: 2,
  description: "Describe or name an object that is familiar to you. You sense the direction to the object's location, as long as that object is within 1,000 feet of you. If the object is in motion, you know the direction of its movement.

The spell can locate a specific object known to you, as long as you have seen it up close - within 30 feet - at least once. Alternatively, the spell can locate the nearest object of a particular kind, such as a certain kind of apparel, jewelry, furniture, tool, or weapon.

This spell can't locate an object if any thickness of lead, even a thin sheet, blocks a direct path between you and the object.",
  school: 'divination',
  components: ['V','S','M (a forked twig)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 206,
)

Spell.create(
  name: "Longstrider",
  level: 1,
  description: "You touch a creature. The target's speed increases by 10 feet until the spell ends.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (a pinch of dirt)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 207,
)

Spell.create(
  name: "Mage Armor",
  level: 1,
  description: "You touch a willing creature who isn't wearing armor, and a protective magical force surrounds it until the spell ends. The target's base AC becomes 13 + its Dexterity modifier. The spell ends it if the target dons armor or if you dismiss the spell as an action.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S','M (a piece of cured leather)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 208,
)

Spell.create(
  name: "Mage Hand",
  level: 0,
  description: "A spectral, floating hand appears at a point you choose within range. The hand lasts for the duration or until you dismiss it as an action. The hand vanishes if it is ever more than 30 feet away from you or if you cast this spell again.

You can use your action to control the hand. You can use the hand to manipulate an object, open an unlocked door or container, stow or retrieve an item from an open container, or pour the contents out of a vial. You can move the hand up to 30 feet each time you use it.

The hand can't attack, activate magical items, or carry more than 10 pounds.",
  school: 'conjuration',
  range: '30 feet',
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 209,
)

Spell.create(
  name: "Magic Circle",
  level: 3,
  description: "You create a 10-foot-radius, 20-foot-tall cylinder of magical energy centered on a point on the ground that you can see within range. Glowing runes appear wherever the cylinder intersects with the floor or other surface.

Choose one or more of the following types of creatures - celestials, elementals, fey, fiends, or undead. The circle affects a creature of the chosen type in the following ways.

• The creature can't willingly enter the cylinder by nonmagical means. If the creature tries to use teleportation or interplanar travel to do so, it must first succeed on a Charisma saving throw.

• The creature has disadvantage on attack rolls against targets within the cylinder.

• Targets within the cylinder can't be charmed, frightened, or possessed by the creature.

When you cast this spell, you can elect to cause its magic to operate in the reverse direction, preventing a creature of the specified type from leaving the cylinder and protecting targets outside it.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the duration increases by 1 hour for each slot level above 3rd.",
  school: 'abjuration',
  cast_time: '1 minute',
  range: '10 feet',
  components: ['V','S','M (holy water or powdered silver and iron worth at least 100 gp, which the spell consumes)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 210,
)

Spell.create(
  name: "Magic Jar",
  level: 6,
  description: "Your body falls into a catatonic state as your soul leaves it and enters the container you used for the spell's material component. While your soul inhabits the container, you are aware of your surroundings as if you were in the container's space. You can't move or use reactions. The only action you can take is to project your soul up to 100 feet out of the container, either returning to your living body (and ending the spell) or attempting to possess a humanoids body.

You can attempt to possess any humanoid within 100 feet of you that you can see (creatures warded by a Protection from Evil and Good or Magic Circle ⁠spells can't be possessed). The target must make a Charisma saving throw. On a failure, your soul moves into the target's body, and the target's soul becomes trapped in the container. On a success, the target resists your efforts to possess it, and you can't attempt to possess it again for 24 hours.

Once you possess a creature's body, you control it. Your game statistics are replaced by the statistics of the creature though you retain your alignment and your Intelligence, Wisdom, and Charisma scores. You retain the benefit of your own class feature. If the target has any class levels, you can't use any of its class features.

Meanwhile, the possessed creature's soul can perceive from the container using its own senses, but it can't move or take actions at all.

While possessing a body, you can use your action to return from the host body to the container if it is within 100 feet of you, returning the host creature's soul to its body. If the host body dies while you're in it, the creature dies, and you must make a Charisma saving throw against your own spellcasting DC. On a success, you return to the container if it is within 100 feet of you. Otherwise, you die.

If the container is destroyed or the spell ends, your soul immediately returns to your body. If your body is more than 100 feet away from you, or if your body is dead when you attempt to return to it, you die. If another creature's soul is in the container when it is destroyed, the creature's soul returns to its body if the body is alive and within 100 feet. Otherwise, that creature dies.

When the spell ends, the container is destroyed.",
  school: 'necromancy',
  cast_time: '1 minute',
  components: ['V','S','M (a gem, crystal, reliquary, or some other ornamental container worth at least 500 gp)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 211,
)

Spell.create(
  name: "Magic Missile",
  level: 1,
  description: "You create three glowing darts of magical force. Each dart hits a creature of your choice that you can see within range. A dart deals 1d4+1 force damage to its target. The darts all strike simultaneously and you can direct them to hit one creature or several.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the spell creates one more dart for each slot above 1st.",
  school: 'evocation',
  range: '120 feet',
  attack: 'true',
  atk_dmg: {
    1=> '1d4 + 1',
  },
  dmg_type: 'Force',
  id: 212,
)

Spell.create(
  name: "Magic Mouth",
  level: 2,
  description: "You implant a message within an object in range, a message that is uttered when a trigger condition is met. Choose an object that you can see and that isn't being worn or carried by another creature. Then speak the message, which must be 25 words or less, though it can be delivered over as long as 10 minutes. Finally, determine the circumstance that will trigger the spell to deliver your message.

When that circumstance occurs, a magical mouth appears on the object and recites the message in your voice and at the same volume you spoke. If the object you chose has a mouth or something that looks like a mouth (for example, the mouth of a statue), the magical mouth appears there so that words appear to come from the object's mouth. When you cast this spell, you can have the spell end after it delivers its message, or it can remain and repeats its message whenever the trigger occurs.

The triggering circumstance can be as general or as detailed as you like, though it must be based on visual or audible conditions that occur within 30 feet of the object. For example, you could instruct the mouth to speak when any creature moves within 30 feet of the object or when a silver bell rings within 30 feet of it.",
  school: 'illusion',
  cast_time: '1 minute',
  ritual: 1,
  range: '30 feet',
  components: ['V','S','M (a small bit of honeycomb and jade dust worth at least 10 gp, which the spell consumes)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 213,
)

Spell.create(
  name: "Magic Weapon",
  level: 2,
  description: "You touch a nonmagical weapon. Until the spell ends, that weapon becomes a magic weapon with a +1 bonus to attack rolls and damage rolls.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the bonus increases to +2. When you use a spell slot of 6th level or higher, the bonus increases to +3.",
  school: 'transmutation',
  cast_time: '1 bonus action',
  range: 'Touch',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 214,
)

Spell.create(
  name: "Major Image",
  level: 3,
  description: "You create the image of an object, a creature, or some other visible phenomenon that is no larger than a 20-foot cube. The image appears at a spot that you can see within range and lasts for the duration. It seems completely real, including sounds, smells, and temperature appropriate to the thing depicted. You can't create sufficient heat or cold to cause damage, a sound loud enough to deal thunder damage or deafen a creature, or a smell that might sicken a creature (like a troglodyte's stench).

As long as you are within range of the illusion, you can use your action to cause the image to move to any other spot within range. As the image changes location, you can alter its appearance so that its movements appear natural for the image. For example, if you create an image of a creature and move it, you can alter the image so that it appears to be walking. Similarly, you can cause the illusion to make different sounds at different times, even making it carry on a conversation, for example.

Physical interaction with the image reveals it to be an illusion, because things can pass through it. A creature that uses its action to examine the image can determine that it is an illusion with a successful Intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the creature can see through the image, and its other sensory qualities become faint to the creature.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the spell lasts until dispelled, without requiring your concentration.",
  school: 'illusion',
  range: '120 feet',
  components: ['V','S','M (a bit of fleece)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 215,
)

Spell.create(
  name: "Mass Cure Wounds",
  level: 5,
  description: "A wave of healing energy washes out from a point of your choice within range. Choose up to six creatures in a 30-foot-radius sphere centered on that point. Each target regains hit points equal to 3d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.

At Higher Levels: When you cast this spell using a spell slot of 6th level or higher, the healing increases by 1d8 for each slot level above 5th.",
  school: 'evocation',
  range: '60 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 216,
)

Spell.create(
  name: "Mass Heal",
  level: 9,
  description: "A flood of healing energy flows from you into injured creatures around you. You restore up to 700 hit points, divided as you choose among any number of creatures that you can see within range. Creatures healed by this spell are also cured of all diseases and any effect making them blinded or deafened. This spell has no effect on undead or constructs.",
  school: 'evocation',
  range: '60 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 217,
)

Spell.create(
  name: "Mass Healing Word",
  level: 3,
  description: "As you call out words of restoration, up to six creatures of your choice that you can see within range regain hit points equal to 1d4 + your spellcasting ability modifier. This spell has no effect on undead or constructs.

At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the healing increases by 1d4 for each slot level above 3rd.",
  school: 'evocation',
  range: '60 feet',
  cast_time: '1 bonus action',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 218,
)

Spell.create(
  name: "Mass Suggestion",
  level: 6,
  description: "You suggest a course of activity (limited to a sentence or two) and magically influence up to twelve creatures of your choice that you can see within range and that can hear and understand you. Creatures that can't be charmed are immune to this effect. The suggestion must be worded in such a manner as to make the course of action sound reasonable. Asking the creature to stab itself, throw itself onto a spear, immolate itself, or do some other obviously harmful act automatically negates the effect of the spell.

Each target must make a Wisdom saving throw. On a failed save, it pursues the course of action you described to the best of its ability. The suggested course of action can continue for the entire duration. If the suggested activity can be completed in a shorter time, the spell ends when the subject finishes what it was asked to do.

You can also specify conditions that will trigger a special activity during the duration. For example, you might suggest that a group of soldiers give all their money to the first beggar they meet. If the condition isn't met before the spell ends, the activity isn't performed.

If you or any of your companions damage a creature affected by this spell, the spell ends for that creature.

At Higher Levels: When you cast this spell using a 7th-level spell slot, the duration is 10 days. When you use an 8th-level spell slot, the duration is 30 days. When you use a 9th-level spell slot, the duration is a year and a day.",
  school: 'enchantment',
  range: '60 feet',
  components: ['V',"M (a snake's tongue and eithe a bit of honeycomb or a drop of oil)"],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 219,
)

Spell.create(
  name: "Maze",
  level: 8,
  description: "You banish a creature that you can see within range into a labyrinthine demiplane. The target remains there for the duration or until it escapes the maze.

The target can use its action to attempt to escape. When it does so, it makes a DC 20 Intelligence check. If it succeeds, it escapes, and the spell ends (a minotaur or goristro demon automatically succeeds).

When the spell ends, the target reappears in the space it left or, if that space is occupied, in the nearest unoccupied space.",
  school: 'conjuration',
  range: '60 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 220,
)

Spell.create(
  name: "Meld into Stone",
  level: 3,
  description: "You step into a stone object or surface large enough to fully contain your body, melding yourself and all the equipment you carry with the stone for the duration. Using your movement, you step into the stone at a point you can touch. Nothing of your presence remains visible or otherwise detectable by nonmagical senses.

While merged with the stone, you can't see what occurs outside it, and any Wisdom (Perception) checks you make to hear sounds outside it are made with disadvantage. You remain aware of the passage of time and can cast spells on yourself while merged in the stone. You can use your movement to leave the stone where you entered it, which ends the spell. You otherwise can't move.

Minor physical damage to the stone doesn't harm you, but its partial destruction or a change in its shape (to the extent that you no longer fit within it) expels you and deals 6d6 bludgeoning damage to you. The stone's complete destruction (or transmutation into a different substance) expels you and deals 50 bludgeoning damage to you. If expelled, you fall prone in an unoccupied space closest to where you first entered.",
  school: 'transmutation',
  ritual: 1,
  range: 'Touch',
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 221,
)

Spell.create(
  name: "Melf's Acid Arrow",
  level: 2,
  description: "A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, the damage (both initial and later) increases by 1d4 for each slot level above 2nd.",
  school: 'evocation',
  range: '90 feet',
  components: ['V','S',"M (powdered rhubarb leaf and an adder's stomach)"],
  attack: 'true',
  atk_dmg: {
    1=> '4/2d4',
  },
  dmg_type: 'Acid',
  id: 222,
)

Spell.create(
  name: "Mending",
  level: 0,
  description: "This spell repairs a single break or tear in an object you touch, such as broken chain link, two halves of a broken key, a torn clack, or a leaking wineskin. As long as the break or tear is no larger than 1 foot in any dimension, you mend it, leaving no trace of the former damage.

This spell can physically repair a magic item or construct, but the spell can't restore magic to such an object.",
  school: 'transmutation',
  range: 'Touch',
  cast_time: '1 minute',
  components: ['V','S','M (two lodestones)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 223,
)

Spell.create(
  name: "Message",
  level: 0,
  description: "You point your finger toward a creature within range and whisper a message. The target (and only the target) hears the message and can reply in a whisper that only you can hear.

You can cast this spell through solid objects if you are familiar with the target and know it is beyond the barrier. Magical silence, 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood blocks the spell. The spell doesn't have to follow a straight line and can travel freely around corners or through openings.",
  school: 'transmutation',
  range: '120 feet',
  components: ['V','S','M (a short piece of copper wire)'],
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 224,
)

Spell.create(
  name: "Meteor Swarm",
  level: 9,
  description: "Blazing orbs of fire plummet to the ground at four different points you can see within range. Each creature in a 40-foot-radius sphere centered on each point you choose must make a Dexterity saving throw. The sphere spreads around corners. A creature takes 20d6 fire damage and 20d6 bludgeoning damage on a failed save, or half as much damage on a successful one. A creature in the area of more than one fiery burst is affected only once.

The spell damages objects in the area and ignites flammable objects that aren't being worn or carried.",
  school: 'evocation',
  range: '1 mile',
  attack: 'true',
  atk_dmg: {
    1=> '20d6',
  },
  dmg_type: 'Fire',
  id: 225,
)

Spell.create(
  name: "Mind Blank",
  level: 8,
  description: "Until the spell ends, one willing creature you touch is immune to psychic damage, any effect that would sense its emotions or read its thoughts, divination spells, and the charmed condition. The spell even foils wish spells and spells or effects of similar power used to affect the target's mind or to gain information about the target.",
  school: 'abjuration',
  range: 'Touch',
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 226,
)

Spell.create(
  name: "Minor Illusion",
  level: 0,
  description: "You create a sound or an image of an object within range that lasts for the duration. The illusion also ends if you dismiss it as an action or cast this spell again.

If you create a sound, its volume can range from a whisper to a scream. It can be your voice, someone else's voice, a lion's roar, a beating of drums, or any other sound you choose. The sound continues unabated throughout the duration, or you can make discrete sounds at different times before the spell ends.

If you create an image of an object - such as a chair, muddy footprints, or a small chest - it must be no larger than a 5-foot cube. The image can't create sound, light, smell, or any other sensory effect. Physical interaction with the image reveals it to be an illusion, because things can pass through it.

If a creature uses its action to examine the sound or image, the creature can determine that it is an illusion with a successful Intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the illusion becomes faint to the creature.",
  school: 'illusion',
  range: '30 feet',
  components: ['S','M (a bit of fleece)'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 227,
)

Spell.create(
  name: "Mirage Arcane",
  level: 7,
  description: "You make terrain in an area up to 1 mile square look, sound, smell, and even feel like some other sort of terrain. The terrain's general shape remains the same, however. Open fields or a road could be made to resemble a swamp, hill, crevasse, or some other difficult or impassable terrain. A pond can be made to seem like a grassy meadow, a precipice like a gentle slope, or a rock-strewn gully like a wide and smooth road.

Similarly, you can alter the appearance of structures, or add them where none are present. The spell doesn't disguise, conceal, or add creatures.

The illusion includes audible, visual, tactile, and olfactory elements, so it can turn clear ground into difficult terrain (or vice versa) or otherwise impede movement through the area. Any piece of the illusory terrain (such as a rock or stick) that is removed from the spell's area disappears immediately.

Creatures with truesight can see through the illusion to the terrain's true form, however, all other elements of the illusion remain, so while the creature is aware of the illusion's presence, the creature can still physically interact with the illusion.",
  school: 'illusion',
  cast_time: '10 minutes',
  range: 'Sight',
  duration: '10 days',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 228,
)

Spell.create(
  name: "Mirror Image",
  level: 2,
  description: "Three illusory duplicates of yourself appear in your space. Until the spell ends, the duplicates move with you and mimic your actions, shifting position so it's impossible to track which image is real. You can use your action to dismiss the illusory duplicates.

Each time a creature targets you with an attack during the spell's duration, roll a d20 to determine whether the attack instead targets one of your duplicates.

If you have three duplicates, you must roll a 6 or higher to change the attack's target to a duplicate. With two duplicates, you must roll an 8 or higher. With one duplicate, you must roll an 11 or higher.

A duplicate's AC equals 10 + your Dexterity modifier. If an attack hits a duplicate, the duplicate is destroyed. A duplicate can be destroyed only by an attack that hits it. It ignores all other damage and effects. The spell ends when all three duplicates are destroyed.

A creature is unaffected by this spell if it can't see, if it relies on senses other than sight, such as blindsight, or if it can perceive illusions as false, as with truesight.",
  school: 'illusion',
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 229,
)

Spell.create(
  name: "Mislead",
  level: 5,
  description: "You become invisible at the same time that an illusory double of you appears where you are standing. The double lasts for the duration, but the invisibility ends if you attack or cast a spell.

You can use your action to move your illusory double up to twice your speed and make it gesture, speak, and behave in whatever way you choose. You can see through its eyes and hear through its ears as if you were located where it is. On each of your turns as a bonus action, you can switch from using its senses to using your own, or back again. While you are using its senses, you are blinded and deafened in regard to your own surroundings.",
  school: 'illusion',
  components: ['S'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 230,
)

Spell.create(
  name: "Misty Step",
  level: 2,
  description: "Briefly surrounded by silvery mist, you teleport up to 30 feet to an unoccupied space that you can see.",
  school: 'conjuration',
  cast_time: '1 bonus action',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 231,
)

Spell.create(
  name: "Modify Memory",
  level: 5,
  description: "You attempt to reshape another creature's memories. One creature that you can see must make a Wisdom saving throw. If you are fighting the creature, it has advantage on the saving throw. On a failed save, the target becomes charmed by you for the duration. The charmed target is incapacitated and unaware of its surroundings, though it can still hear you. If it takes any damage or is targeted by another spell, this spell ends, and none of the target's memories are modified.

While this charm lasts, you can affect the target's memory of an event that it experienced within the last 24 hours and that lasted no more than 10 minutes. You can permanently eliminate all memory of the event, allow the target to recall the event with perfect clarity and exacting detail, change its memory of the details of the event, or create a memory of some other event.

You must speak to the target to describe how its memories are affected, and it must be able to understand your language for the modified memories to take root. Its mind fills in any gaps in the details of your description. If the spell ends before you have finished describing the modified memories, the creature's memory isn't altered. Otherwise, the modified memories take hold when the spell ends.

A modified memory doesn't necessarily affect how a creature behaves, particularly if the memory contradicts the creature's natural inclinations, alignment, or beliefs. An illogical modified memory, such as implanting a memory of how much the creature enjoyed dousing itself in acid, is dismissed, perhaps as a bad dream. The DM might deem a modified memory too nonsensical to affect a creature in a significant manner.

A remove curse or greater restoration spell cast on the target restores the creature's true memory.

At Higher Levels: If you cast this spell using a spell slot of 6th level or higher, you can alter the target's memories of an event that took place up to 7 days ago (6th level), 30 days ago (7th level), 1 year ago (8th level), or any time in the creature's past (9th level).",
  school: 'enchantment',
  range: '30 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 232
)

Spell.create(
  name: "Moonbeam",
  level: 2,
  description: "A silvery beam of pale light shines down in a 5-foot radius, 40-foot-high cylinder centered on a point within range. Until the spell ends, dim light fills the cylinder.

When a creature enters the spell's area for the first time on a turn or starts its turn there, it is engulfed in ghostly flames that cause searing pain, and it must make a Constitution saving throw. It takes 2d10 radiant damage on a failed save, or half as much damage on a successful one.

A shapechanger makes its saving throw with disadvantage. If it fails, it also instantly reverts to its original form and can't assume a different form until it leaves the spell's light.

On each of your turns after you cast this spell, you can use an action to move the beam 60 feet in any direction.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 1d10 for each slot level above 2nd.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S','M (several seeds of any moonseed plant and a piece of opalescent feldspar)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '2d10',
  },
  dmg_type: 'Radiant',
  id: 233,
)

Spell.create(
  name: "Mordenkainen's Faithful Hound",
  level: 4,
  description: "You conjure a phantom watchdog in an unoccupied space that you can see within range, where it remains for the duration, until you dismiss it as an action, or until you move more than 100 feet away from it.

The hound is invisible to all creatures except you and can't be harmed. When a Small or larger creature comes within 30 feet of it without first speaking the password that you specify when you cast this spell, the hound starts barking loudly. The hound sees invisible creatures and can see into the Ethereal Plane. It ignores illusions.

At the start of each of your turns, the hound attempts to bite one creature within 5 feet of it that is hostile to you. The hound's attack bonus is equal to your spellcasting ability modifier + your proficiency bonus. On a hit, it deals 4d8 piercing damage.",
  school: 'conjuration',
  range: '30 feet',
  components: ['V','S','M (a tiny silveer whistle, a pice of bone, and a thread)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 234,
)

Spell.create(
  name: "Mordenkainen's Magnificent Manor",
  level: 7,
  description: "You conjure an extradimensional dwelling in range that lasts for the duration. You choose where its one entrance is located. The entrance shimmers faintly and is 5 feet wide and 10 feet tall. You and any creature you designate when you cast the spell can enter the extradimensional dwelling as long as the portal remains open. You can open or close the portal if you are within 30 feet of it. While closed, the portal is invisible.

Beyond the portal is a magnificent foyer with numerous chambers beyond. The atmosphere is clean, fresh, and warm.

You can create any floor plan you like, but the space can't exceed 50 cubes, each cube being 10 feet on each side. The place is furnished and decorated as you choose. It contains sufficient food to serve a nine course banquet for up to 100 people. A staff of 100 near-transparent servants attends all who enter. You decide the visual appearance of these servants and their attire. They are completely obedient to your orders. Each servant can perform any task a normal human servant could perform, but they can't attack or take any action that would directly harm another creature. Thus the servants can fetch things, clean, mend, fold clothes, light fires, serve food, pour wine, and so on. The servants can go anywhere in the mansion but can't leave it. Furnishings and other objects created by this spell dissipate into smoke if removed from the mansion. When the spell ends, any creatures inside the extradimensional space are expelled into the open spaces nearest to the entrance.",
  school: 'conjuration',
  cast_time: '1 minute',
  range: '300 feet',
  components: ['V','S','M (a miniature portal carved from ivory, a small piece of polished marble, and a tiny silver spoon, each item worth at least 5 gp)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 235,
)

Spell.create(
  name: "Mordenkainen's Private Sanctum",
  level: 4,
  description: "You make an area within range magically secure. The area is a cube that can be as small as 5 feet to as large as 100 feet on each side. The spell lasts for the duration or until you use an action to dismiss it.

When you cast the spell, you decide what sort of security the spell provides, choosing any or all of the following properties.

• Sound can't pass through the barrier at the edge of the warded area.

• The barrier of the warded area appears dark and foggy, preventing vision (including darkvision) through it.

• Sensors created by divination spells can't appear inside the protected area or pass through the barrier at its perimeter.

• Creatures in the area can't be targeted by divination spells.

• Nothing can teleport into or out of the warded area.

• Planar travel is blocked within the warded area.

Casting this spell on the same spot every day for a year makes this effect permanent.

At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, you can increase the size of the cube by 100 feet for each slot level beyond 4th. Thus you could protect a cube that can be up to 200 feet on one side by using a spell slot of 5th level.",
  school: 'abjuration',
  cast_time: '10 minutes',
  range: '120 feet',
  components: ['V','S','M (A thin sheet of lead, a piece of opaque glass, a wad of cotton or cloth, and powdered chrysolite)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 236,
)

Spell.create(
  name: "Mordenkainen's Sword",
  level: 7,
  description: "You create a sword-shaped plane of force that hovers within range. It lasts for the duration.

When the sword appears, you make a melee spell attack against a target of your choice within 5 feet of the sword. On a hit, the target takes 3d10 force damage. Until the spell ends, you can use a bonus action on each of your turns to move the sword up to 20 feet to a spot you can see and repeat this attack against the same target or a different one.",
  school: 'evocation',
  range: '60 feet',
  components: ['V','S','M (a miniature platinum sword with a grip and pommel of copper and zinc, worth 250 gp)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '3d10',
  },
  dmg_type: 'Force',
  id: 237,
)

Spell.create(
  name: "Move Earth",
  level: 6,
  description: "Choose an area of terrain no larger than 40 feet on a side within range. You can reshape dirt, sand, or clay in the area in any manner you choose for the duration. You can raise or lower the area's elevation, create or fill in a trench, erect or flatten a wall, or form a pillar. The extent of any such changes can't exceed half the area's largest dimension. So, if you affect a 40-foot square, you can create a pillar up to 20 feet high, raise or lower the square's elevation by up to 20 feet, dig a trench up to 20 feet deep, and so on. It takes 10 minutes for these changes to complete.

At the end of every 10 minutes you spend concentrating on the spell, you can choose a new area of terrain to affect.

Because the terrain's transformation occurs slowly, creatures in the area can't usually be trapped or injured by the ground's movement.

This spell can't manipulate natural stone or stone construction. Rocks and structures shift to accommodate the new terrain. If the way you shape the terrain would make a structure unstable, it might collapse.

Similarly, this spell doesn't directly affect plant growth. The moved earth carries any plants along with it.",
  school: 'transmission',
  range: '120 feet',
  components: ['V','S','M (an iron blade and a small bag containing a mixture of soils - clay, loam, and sand)'],
  duration: 'Concentration, up to 2 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 238,
)

Spell.create(
  name: "Nondetection",
  level: 3,
  description: "For the duration, you hide a target that you touch from divination magic. The target can be a willing creature or a place or an object no larger than 10 feet in any dimension. The target can't be targeted by any divination magic or perceived through magical scrying sensors.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S','M (a pinch of diamond dust worth 25 gp sprinkled over the target, which the spell consumes)'],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 239,
)

Spell.create(
  name: "Nystul's Magic Aura",
  level: 2,
  description: "You place an illusion on a creature or an object you touch so that divination spells reveal false information about it. The target can be a willing creature or an object that isn't being carried or worn by another creature.

When you cast the spell, choose one or both of the following effects. The effect lasts for the duration. If you cast this spell on the same creature or object every day for 30 days, placing the same effect on it each time, the illusion lasts until it is dispelled.

False Aura: You change the way the target appears to spells and magical effects, such as detect magic, that detect magical auras. You can make a nonmagical object appear magical, a magical object appear nonmagical, or change the object's magical aura so that it appears to belong to a specific school of magic that you choose. When you use this effect on an object, you can make the false magic apparent to any creature that handles the item.

Mask: You change the way the target appears to spells and magical effects that detect creature types, such as a paladin's Divine Sense or the trigger of a symbol spell. You choose a creature type and other spells and magical effects treat the target as if it were a creature of that type or of that alignment.",
  school: 'illusion',
  range: 'Touch',
  components: ['V','S','M (a small square of silk)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 240,
)

Spell.create(
  name: "Otiluke's Freezing Sphere",
  level: 6,
  description: "A frigid globe of cold energy streaks from your fingertips to a point of your choice within range, where it explodes in a 60-foot-radius sphere. Each creature within the area must make a Constitution saving throw. On a failed save, a creature takes 10d6 cold damage. On successful save, it takes half as much damage.

If the globe strikes a body of water or a liquid that is principally water (not including water-based creatures), it freezes the liquid to a depth of 6 inches over an area 30 feet square. This ice lasts for 1 minute. Creatures that were swimming on the surface of frozen water are trapped in the ice. A trapped creature can use an action to make a Strength check against your spell save DC to break free.

You can refrain from firing the globe after completing the spell, if you wish. A small globe about the size of a sling stone, cool to the touch, appears in your hand. At any time, you or a creature you give the globe to can throw the globe (to a range of 40 feet) or hurl it with a sling (to the sling's normal range). It shatters on impact, with the same effect as the normal casting of the spell. You can also set the globe down without shattering it. After 1 minute, if the globe hasn't already shattered, it explodes.

At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, the damage increases by 1d6 for each slot level above 6th",
  school: 'evocation',
  range: '300 feet',
  components: ['V','S','M (a small crystal sphere)'],
  attack: 'true',
  atk_dmg: {
    1=> '10d6',
  },
  dmg_type: 'Cold',
  id: 241,
)

Spell.create(
  name: "Otiluke's Resilient Sphere",
  level: 4,
  description: "A sphere of shimmering force encloses a creature or object of Large size or smaller within range. An unwilling creature must make a Dexterity saving throw. On a failed save, the creature is enclosed for the duration.

Nothing, not physical objects, energy, or other spell effects, can pass through the barrier, in or out, though a creature in the sphere can breathe there. The sphere is immune to all damage, and a creature or object inside can't be damaged by attacks or effects originating from outside, nor can a creature inside the sphere damage anything outside it.

The sphere is weightless and just large enough to contain the creature or object inside. An enclosed creature can use its action to push against the sphere's walls and thus roll the sphere at up to half the creature's speed. Similarly, the globe can be picked up and moved by other creatures.

A disintegrate spell targeting the globe destroys it without harming anything inside it.",
  school: 'evocation',
  range: '30 feet',
  components: ['V','S','M (a hemispherical piece of clear crystal and a matching hemispherical piece of gum arabic)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 242,
)

Spell.create(
  name: "Otto's Irresistible Dance",
  level: 6,
  description: "Choose one creature that you can see within range. The target begins a comic dance in place - shuffling, tapping its feet, and capering for the duration. Creatures that can't be charmed are immune to this spell.

A dancing creature must use all its movement to dance without leaving its space and has disadvantage on Dexterity saving throws and attack rolls. While the target is affected by this spell, other creatures have advantage on attack rolls against it. As an action, a dancing creature makes a Wisdom saving throw to regain control of itself. On a successful save, the spell ends.",
  school: 'enchantment',
  range: '30 feet',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 243,
)

Spell.create(
  name: "Pass Without Trace",
  level: 2,
  description: "A veil of shadows and silence radiates from you, masking you and your companions from detection. For the duration, each creature you choose within 30 feet of you (including you) has a +10 bonus to Dexterity (Stealth) checks and can’t be tracked except by magical means. A creature that receives this bonus leaves behind no tracks or other traces of its passage.",
  school: 'abjuration',
  components: ['V','S','M (ashes from a burned leaf of mistletoe and a sprig of spruce)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 244,
)

Spell.create(
  name: "Passwall",
  level: 5,
  description: "A passage appears at a point of your choice that you can see on a wooden, plaster, or stone surface (such as a wall, a ceiling, or a floor) within range, and lasts for the duration. You choose the opening's dimensions - up to 5 feet wide, 8 feet tall, and 20 feet deep. The passage creates no instability in a structure surrounding it.

When the opening disappears, any creatures or objects still in the passage created by the spell are safely ejected to an unoccupied space nearest to the surface on which you cast the spell.",
  school: 'transmutation',
  range: '30 feet',
  components: ['V','S','M (a pinch of sesame seeds)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 245,
)

Spell.create(
  name: "Phantasmal Force",
  level: 2,
  description: "You craft an illusion that takes root in the mind of a creature that you can see within range. The target must make an Intelligence saving throw. On a failed save, you create a phantasmal object, creature, or other visible phenomenon of your choice that is no larger than a 10-foot cube and that is perceivable only to the target for the duration. This spell has no effect on undead or constructs.

The phantasm includes sound, temperature, and other stimuli, also evident only to the creature.

The target can use its action to examine the phantasm with an Intelligence (Investigation) check against your spell save DC. If the check succeeds, the target realizes that the phantasm is an illusion, and the spell ends.

While a target is affected by the spell, the target treats the phantasm as if it were real. The target rationalizes any illogical outcomes from interacting with the phantasm. For example, a target attempting to walk across a phantasmal bridge that spans a chasm falls once it steps onto the bridge. If the target survives the fall, it still believes that the bridge exists and comes up with some other explanation for its fall; it was pushed, it slipped, or a strong wind might have knocked it off.

An affected target is so convinced of the phantasm’s reality that it can even take damage from the illusion. A phantasm created to appear as a creature can attack the target. Similarly, a phantasm created to appear as fire, a pool of acid, or lava can burn the target. Each round on your turn, the phantasm can deal 1d6 psychic damage to the target if it is in the phantasm’s area or within 5 feet of the phantasm, provided that the illusion is of a creature or hazard that could logically deal damage, such as by attacking. The target perceives the damage as a type appropriate to the illusion.",
  school: 'illusion',
  range: '60 feet',
  components: ['V','S','M (a bit of fleece)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 246,
)

Spell.create(
  name: "Phantasmal Killer",
  level: 4,
  description: "You tap into the nightmares of a creature you can see within range and create an illusory manifestation of its deepest fears, visible only to that creature. The target must make a Wisdom saving throw. On a failed save, the target becomes frightened for the duration. At the end of each of the target's turns before the spell ends, the target must succeed on a Wisdom saving throw or take 4d10 psychic damage. On a successful save, the spell ends.

At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, the damage increases by 1d10 for each slot level above 4th.",
  school: 'illusion',
  range: '120 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '4d10',
  },
  dmg_type: 'Psychic',
  id: 247,
)

Spell.create(
  name: "Phantom Steed",
  level: 3,
  description: "A Large quasi-real, horse-like creature appears on the ground in an unoccupied space of your choice within range. You decide the creature's appearance, but it is equipped with a saddle, bit, and bridle. Any of the equipment created by the spell vanishes in a puff of smoke if it is carried more than 10 feet away from the steed.

For the duration, you or a creature you choose can ride the steed. The creature uses the statistics for a riding horse, except it has a speed of 100 feet and can travel 10 miles in an hour, or 13 miles at a fast pace. When the spell ends, the steed gradually fades, giving the rider 1 minute to dismount. The spell ends if you use an action to dismiss it or if the steed takes any damage.",
  school: 'illusion',
  ritual: 1,
  range: '30 feet',
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 248,
)

Spell.create(
  name: "Planar Ally",
  level: 6,
  description: "You beseech an otherworldly entity for aid. The being must be known to you - a god, a primordial, a demon prince, or some other being of cosmic power. That entity sends a celestial, an elemental, or a fiend loyal to it to aid you, making the creature appear in an unoccupied space within range. If you know a specific creature's name, you can speak that name when you cast this spell to request that creature, though you might get a different creature anyway (DM's choice).

When the creature appears, it is under no compulsion to behave in any particular way. You can ask the creature to perform a service in exchange for payment, but it isn't obliged to do so. The requested task could range from simple (fly us across the chasm, or help us fight a battle) to complex (spy on our enemies, or protect us during our foray into the dungeon). You must be able to communicate with the creature to bargain for its services.

Payment can take a variety of forms. A celestial might require a sizable donation of gold or magic items to an allied temple, while a fiend might demand a living sacrifice or a gift of treasure. Some creatures might exchange their service for a quest undertaken by you.

As a rule of thumb, a task that can be measured in minutes requires a payment worth 100 gp per minute. A task measured in hours requires 1,000 gp per hour. And a task measured in days (up to 10 days) requires 10,000 gp per day. The DM can adjust these payments based on the circumstances under which you cast the spell. If the task is aligned with the creature's ethos, the payment might be halved or even waived. Nonhazardous tasks typically require only half the suggested payment, while especially dangerous tasks might require a greater gift. Creatures rarely accept tasks that seem suicidal.

After the creature completes the task, or when the agreed-upon duration of service expires, the creature returns to its home plane after reporting back to you, if appropriate to the task and if possible. If you are unable to agree on a price for the creature's service, the creature immediately returns to its home plane.

A creature enlisted to join your group counts as a member of it, receiving a full share of experience points awarded.",
  school: 'conjuration',
  range: '60 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 249,
)

Spell.create(
  name: "Planar Binding",
  level: 5,
  description: "With this spell, you attempt to bind a celestial, an elemental, a fey, or a fiend to your service. The creature must be within range for the entire casting of the spell. (Typically, the creature is first summoned into the center of an inverted magic circle in order to keep it trapped while this spell is cast.) At the completion of the casting, the target must make a Charisma saving throw. On a failed save, it is bound to serve you for the duration. If the creature was summoned or created by another spell, that spell's duration is extended to match the duration of this spell.

A bound creature must follow your instructions to the best of its ability. You might command the creature to accompany you on an adventure, to guard a location, or to deliver a message. The creature obeys the letter of your instructions, but if the creature is hostile to you, it strives to twist your words to achieve its own objectives. If the creature carries out your instructions completely before the spell ends, it travels to you to report this fact if you are on the same plane of existence. If you are on a different plane of existence, it returns to the place where you bound it and remains there until the spell ends.

At Higher Levels: When you cast this spell using a spell slot of a higher level, the duration increases to 10 days with a 6th-level slot, to 30 days with a 7th-level slot, to 180 days with an 8th-level slot, and to a year and a day with a 9th-level spell slot.",
  school: 'abjuration',
  range: '60 feet',
  components: ['V','S','M (a jewel worth at least 1,000 gp, which the spell consumes)'],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 250,
)

Spell.create(
  name: "Plane Shift",
  level: 7,
  description: "You and up to eight willing creatures who link hands in a circle are transported to a different plane of existence. You can specify a target destination in general terms, such as the City of Brass on the Elemental Plane of Fire or the palace of Dispater on the second level of the Nine Hells, and you appear in or near that destination. If you are trying to reach the City of Brass, for example, you might arrive in its Street of Steel, before its Gate of Ashes, or looking at the city from across the Sea of Fire, at the DM's discretion.

Alternatively, if you know the sigil sequence of a teleportation circle on another plane of existence, this spell can take you to that circle. If the teleportation circle is too small to hold all the creatures you transported, they appear in the closest unoccupied spaces next to the circle.

You can use this spell to banish an unwilling creature to another plane. Choose a creature within your reach and make a melee spell attack against it. On a hit, the creature must make a Charisma saving throw. If the creature fails the save, it is transported to a random location on the plane of existence you specify. A creature so transported must find its own way back to your current plane of existence.",
  school: 'conjuration',
  range: 'Touch',
  components: ['V','S','M (a forked, metal rod worth at least 250 gp, attuned to a particular plane of existence)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 251,
)

Spell.create(
  name: "Plant Growth",
  level: 3,
  description: "This spell channels vitality into plants within a specific area. There are two possible uses for the spell, granting either immediate or long-term benefits.

If you cast this spell using 1 action, choose a point within range. All normal plants in a 100-foot radius centered on that point become thick and overgrown. A creature moving through the area must spend 4 feet of movement for every 1 foot it moves.

You can exclude one or more areas of any size within the spell's area from being affected.

If you cast this spell over 8 hours, you enrich the land. All plants in a half-mile radius centered on a point within range become enriched for 1 year. The plants yield twice the normal amount of food when harvested.",
  school: 'transmutation',
  cast_time: '1 action or 8 hours',
  range: '150 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 252,
)

Spell.create(
  name: "Poison Spray",
  level: 0,
  description: "You extend your hand toward a creature you can see within range and project a puff of noxious gas from your palm. The creature must succeed on a Constitution saving throw or take 1d12 poison damage.

This spell's damage increases by 1d12 when you reach 5th level (2d12), 11th level (3d12), and 17th level (4d12).",
  school: 'conjuration',
  range: '10 feet',
  attack: 'true',
  atk_dmg: {
    1=> '1d12',
    5=> '2d12',
    11=> '3d12',
    17=> '4d12',
  },
  dmg_type: 'Poison',
  id: 253,
)

Spell.create(
  name: "Polymorph",
  level: 4,
  description: "This spell transforms a creature with at least 1 hit point that you can see within range into a new form. An unwilling creature must make a Wisdom saving throw to avoid the effect. A shapechanger automatically succeeds on this saving throw.

The transformation lasts for the duration, or until the target drops to 0 hit points or dies. The new form can be any beast whose challenge rating is equal to or less than the target's (or the target's level, if it doesn't have a challenge rating). The target's game statistics, including mental ability scores, are replaced by the statistics of the chosen beast. It retains its alignment and personality.

The target assumes the hit points of its new form. When it reverts to its normal form, the creature returns to the number of hit points it had before it transformed. If it reverts as a result of dropping to 0 hit points, any excess damage carries over to its normal form. As long as the excess damage doesn't reduce the creature's normal form to 0 hit points, it isn't knocked unconscious.

The creature is limited in the actions it can perform by the nature of its new form, and it can't speak, cast spells, or take any other action that requires hands or speech.

The target's gear melds into the new form. The creature can't activate, use, wield, or otherwise benefit from any of its equipment.",
  school: 'transmutation',
  range: '60 feet',
  components: ['V','S','M (a caterpillar cocoon)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 254,
)

Spell.create(
  name: "Power Word Heal",
  level: 9,
  description: "A wave of healing energy washes over a creature you touch. The target regains all its hit points. If the creature is charmed, frightened, paralyzed, or stunned, the condition ends. If the creature is prone, it can use its reaction to stand up. This spell has no effect on undead or constructs.",
  school: 'evocation',
  range: 'Touch',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 255,
)

Spell.create(
  name: "Power Word Kill",
  level: 9,
  description: "You utter a word of power that can compel one creature you can see within range to die instantly. If the creature you chose has 100 hit points or fewer, it dies. Otherwise, the spell has no effect.",
  school: 'enchantment',
  range: '60 feet',
  components: ['V'],
  attack: 'true',
  atk_dmg: {
    1=> '100',
  },
  dmg_type: '',
  id: 256,
)

Spell.create(
  name: "Power Word Stun",
  level: 8,
  description: "You speak a word of power that can overwhelm the mind of one creature you can see within range, leaving it dumbfounded. If the target has 150 hit points or fewer, it is stunned. Otherwise, the spell has no effect.

The stunned target must make a Constitution saving throw at the end of each of its turns. On a successful save, this stunning effect ends.",
  school: 'enchantment',
  range: '60 feet',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 257,
)

Spell.create(
  name: "Prayer of Healing",
  level: 2,
  description: "Up to six creatures of your choice that you can see within range each regain hit points equal to 2d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, the healing increases by 1d8 for each slot level above 2nd.",
  school: 'evocation',
  range: '30 feet',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 258,
)

Spell.create(
  name: "Prestidigitation",
  level: 0,
  description: "This spell is a minor magical trick that novice spellcasters use for practice. You create one of the following magical effects within range.

• You create an instantaneous, harmless sensory effect, such as a shower of sparks, a puff of wind, faint musical notes, or an odd odor.

• You instantaneously light or snuff out a candle, a torch, or a small campfire.

• You instantaneously clean or soil an object no larger than 1 cubic foot.

• You chill, warm, or flavor up to 1 cubic foot of nonliving material for 1 hour.

• You make a color, a small mark, or a symbol appear on an object or a surface for 1 hour.

• You create a nonmagical trinket or an illusory image that can fit in your hand and that lasts until the end of your next turn.

If you cast this spell multiple times, you can have up to three of its non-instantaneous effects active at a time, and you can dismiss such an effect as an action.",
  school: 'transmutation',
  range: '10 feet',
  duration: 'Up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 259,
)

Spell.create(
  name: "Prismatic Spray",
  level: 7,
  description: "Eight multicolored rays of light flash from your hand. Each ray is a different color and has a different power and purpose. Each creature in a 60-foot cone must make a Dexterity saving throw. For each target, roll a d8 to determine which color ray affects it.

1-Red: The target takes 10d6 fire damage on a failed save, or half as much damage on a successful one.

2-Orange: The target takes 10d6 acid damage on a failed save, or half as much damage on a successful one.

3-Yellow: The target takes 10d6 lightning damage on a failed save, or half as much damage on a successful one.

4-Green: The target takes 10d6 poison damage on a failed save, or half as much damage on a successful one.

5-Blue: The target takes 10d6 cold damage on a failed save, or half as much damage on a successful one.

6-Indigo: On a failed save, the target is restrained. It must then make a Constitution saving throw at the end of each of its turns. If it successfully saves three times, the spell ends. If it fails its save three times, it permanently turns to stone and is subjected to the petrified condition. The successes and failures don't need to be consecutive, keep track of both until the target collects three of a kind.

7-Violet: On a failed save, the target is blinded. It must then make a Wisdom saving throw at the start of your next turn. A successful save ends the blindness. If it fails that save, the creature is transported to another plane of existence of the DM's choosing and is no longer blinded. (Typically, a creature that is on a plane that isn't its home plane is banished home, while other creatures are usually cast into the Astral or Ethereal planes.)

8-Special: The target is struck by two rays. Roll twice more, rerolling any 8.",
  school: 'evocation',
  range: 'Self (60-foot cone)',
  attack: 'true',
  atk_dmg: {
    1=> '10d6',
  },
  dmg_type: 'Elemental',
  id: 260,
)

Spell.create(
  name: "Prismatic Wall",
  level: 9,
  description: "A shimmering, multicolored plane of light forms a vertical opaque wall - up to 90 feet long, 30 feet high, and 1 inch thick - centered on a point you can see within range. Alternatively, you can shape the wall into a sphere up to 30 feet in diameter centered on a point you choose within range.

The wall remains in place for the duration. If you position the wall so that it passes through a space occupied by a creature, the spell fails, and your action and the spell slot are wasted. The wall sheds bright light out to a range of 100 feet and dim light for an additional 100 feet. You and creatures you designate at the time you cast the spell can pass through and remain near the wall without harm. If another creature that can see the wall moves to within 20 feet of it or starts its turn there, the creature must succeed on a Constitution saving throw or become blinded for 1 minute.

The wall consists of seven layers, each with a different color. When a creature attempts to reach into or pass through the wall, it does so one layer at a time through all the wall's layers. As it passes or reaches through each layer, the creature must make a Dexterity saving throw or be affected by that layer's properties as described below.

The wall can be destroyed, also one layer at a time, in order from red to violet, by means specific to each layer. Once a layer is destroyed, it remains so for the duration of the spell. A rod of cancellation destroys a prismatic wall, but an antimagic field has no effect on it.

Red: The creature takes 10d6 fire damage on a failed save, or half as much damage on a successful one. While this layer is in place, nonmagical ranged attacks can't pass through the wall. The layer can be destroyed by dealing at least 25 cold damage to it.

Orange: The creature takes 10d6 acid damage on a failed save, or half as much damage on a successful one. While this layer is in place, magical ranged attacks can't pass through the wall. The layer is destroyed by a strong wind.

Yellow: The creature takes 10d6 lightning damage on a failed save, or half as much damage on a successful one. This layer can be destroyed by dealing at least 60 force damage to it.

Green: The creature takes 10d6 poison damage on a failed save, or half as much damage on a successful one. A passwall spell, or another spell of equal or greater level that can open a portal on a solid surface, destroys this layer.

Blue: The creature takes 10d6 cold damage on a failed save, or half as much damage on a successful one. This layer can be destroyed by dealing at least 25 fire damage to it.

Indigo: On a failed save, the creature is restrained. It must then make a Constitution saving throw at the end of each of its turns. If it successfully saves three times, the spell ends. If it fails its save three times, it permanently turns to stone and is subjected to the petrified condition. The successes and failures don't need to be consecutive, keep track of both until the creature collects three of a kind. While this layer is in place, spells can't be cast through the wall. The layer is destroyed by bright light shed by a daylight spell or a similar spell of equal or higher level.

Violet: On a failed save, the creature is blinded. It must then make a Wisdom saving throw at the start of your next turn. A successful save ends the blindness. If it fails that save, the creature is transported to another plane of the DM's choosing and is no longer blinded. (Typically, a creature that is on a plane that isn't its home plane is banished home, while other creatures are usually cast into the Astral or Ethereal planes.) This layer is destroyed by a dispel magic spell or a similar spell of equal or higher level that can end spells and magical effects.",
  school: 'abjuration',
  range: '60 feet',
  duration: '10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 261,
)

Spell.create(
  name: "Produce Flame",
  level: 0,
  description: "A flickering flame appears in your hand. The flame remains there for the duration and harms neither you nor your equipment. The flame sheds bright light in a 10-foot radius and dim light for an additional 10 feet. The spell ends if you dismiss it as an action or if you cast it again.

You can also attack with the flame, although doing so ends the spell. When you cast this spell, or as an action on a later turn, you can hurl the flame at a creature within 30 feet of you. Make a ranged spell attack. On a hit, the target takes 1d8 fire damage.

This spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  school: 'conjuration',
  range: '30 feet',
  duration: '10 minutes',
  attack: 'true',
  atk_dmg: {
    1=> '1d8',
    5=> '2d8',
    11=> '3d8',
    17=> '4d8',
  },
  dmg_type: 'Fire',
  id: 262,
)

Spell.create(
  name: "Programmed Illusion",
  level: 6,
  description: "You create an illusion of an object, a creature, or some other visible phenomenon within range that activates when a specific condition occurs. The illusion is imperceptible until then. It must be no larger than a 30-foot cube, and you decide when you cast the spell how the illusion behaves and what sounds it makes. This scripted performance can last up to 5 minutes.

When the condition you specify occurs, the illusion springs into existence and performs in the manner you described. Once the illusion finishes performing, it disappears and remains dormant for 10 minutes. After this time, the illusion can be activated again.

The triggering condition can be as general or as detailed as you like, though it must be based on visual or audible conditions that occur within 30 feet of the area. For example, you could create an illusion of yourself to appear and warn off others who attempt to open a trapped door, or you could set the illusion to trigger only when a creature says the correct word or phrase.

Physical interaction with the image reveals it to be an illusion, because things can pass through it. A creature that uses its action to examine the image can determine that it is an illusion with a successful Intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the creature can see through the image, and any noise it makes sounds hollow to the creature.",
  school: 'illusion',
  range: '120 feet',
  components: ['V','S','M (a bit of fleece and jade dust worth at least 25 gp)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 263,
)

Spell.create(
  name: "Project Image",
  level: 7,
  description: "You create an illusory copy of yourself that lasts for the duration. The copy can appear at any location within range that you have seen before, regardless of intervening obstacles. The illusion looks and sounds like you but is intangible. If the illusion takes any damage, it disappears, and the spell ends.

You can use your action to move this illusion up to twice your speed, and make it gesture, speak, and behave in whatever way you choose. It mimics your mannerisms perfectly.

You can see through its eyes and hear through its ears as if you were in its space. On your turn as a bonus action, you can switch from using its senses to using your own, or back again. While you are using its senses, you are blinded and deafened in regard to your own surroundings.

Physical interaction with the image reveals it to be an illusion, because things can pass through it. A creature that uses its action to examine the image can determine that it is an illusion with a successful Intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the creature can see through the image, and any noise it makes sounds hollow to the creature.",
  school: 'illusion',
  range: '500 miles',
  components: ['V','S','M (a small replica of you made from materials worth at least 5 gp)'],
  duration: 'Concentration, up to 1 day',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 264,
)

Spell.create(
  name: "Protection from Energy",
  level: 3,
  description: "For the duration, the willing creature you touch has resistance to one damage type of your choice - acid, cold, fire, lightning, or thunder.",
  school: 'abjuration',
  range: 'Touch',
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 265,
)

Spell.create(
  name: "Protection from Evil and Good",
  level: 1,
  description: "Until the spell ends, one willing creature you touch is protected against certain types of creatures - aberrations, celestials, elementals, fey, fiends, and undead.

The protection grants several benefits. Creatures of those types have disadvantage on attack rolls against the target. The target also can't be charmed, frightened, or possessed by them. If the target is already charmed, frightened, or possessed by such a creature, the target has advantage on any new saving throw against the relevant effect.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S','M (holy water, or powdered silver and iron, which the spell consumes)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 266,
)

Spell.create(
  name: "Protection from Poison",
  level: 2,
  description: "You touch a creature. If it is poisoned, you neutralize the poison. If more than one poison afflicts the target, you neutralize one poison that you know is present, or you neutralize one at random.

For the duration, the target has advantage on saving throws against being poisoned, and it has resistance to poison damage.
Show Attribute List
",
  school: 'abjuration',
  range: 'Touch',
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 267,
)

Spell.create(
  name: "Purify Food and Drink",
  level: 1,
  description: "All nonmagical food and drink within a 5-foot-radius sphere centered on a point of your choice within range is purified and rendered free of poison and disease.",
  school: 'transmutation',
  ritual: 1,
  range: '10 feet',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 268,
)

Spell.create(
  name: "Raise Dead",
  level: 5,
  description: "You return a dead creature you touch to life, provided that it has been dead no longer than 10 days. If the creature's soul is both willing and at liberty to rejoin the body, the creature returns to life with 1 hit point.

This spell also neutralizes any poison and cures nonmagical diseases that affected the creature at the time it died. This spell doesn't, however, remove magical diseases, curses, or similar effects, if these aren't first removed prior to casting the spell, they take effect when the creature returns to life. The spell can't return an undead creature to life.

This spell closes all mortal wounds, but it doesn't restore missing body parts. If the creature is lacking body parts or organs integral for its survival - its head, for instance - the spell automatically fails.

Coming back from the dead is an ordeal. The target takes a -4 penalty to all attack rolls, saving throws, and ability checks. Every time the target finishes a long rest, the penalty is reduced by 1 until it disappears.",
  school: 'necromancy',
  range: 'Touch',
  cast_time: '1 hour',
  components: ['V','S','M (a diamond worth at least 500 gp, which the spell consumes)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 269,
)

Spell.create(
  name: "Rary's Telepathic Bond",
  level: 5,
  description: "You forge a telepathic link among up to eight willing creatures of your choice within range, psychically linking each creature to all the others for the duration. Creatures with Intelligence scores of 2 or less aren't affected by this spell.

Until the spell ends, the targets⁠ can communicate telepathically through the bond whether or not they have a common⁠ language. The communication⁠ is possible over any distance, though it can't extend to other planes of existence.",
  school: 'divination',
  ritual: 1,
  range: '30 feet',
  components: ['V','S','M (pieces of eggshell from two different kinds of creatures)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 270,
)

Spell.create(
  name: "Ray of Enfeeblement",
  level: 2,
  description: "A black beam of enervating energy springs from your finger toward a creature within range. Make a ranged spell attack against the target. On a hit, the target deals only half damage with weapon attacks that use Strength until the spell ends.

At the end of each of the target's turns, it can make a Constitution saving throw against the spell. On a success, the spell ends.",
  school: 'necromancy',
  range: '60 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 271,
)

Spell.create(
  name: "Ray of Frost",
  level: 0,
  description: "A frigid beam of blue-white light streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, it takes 1d8 cold damage, and its speed is reduced by 10 feet until the start of your next turn.

The spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  school: 'evocation',
  range: '60 feet',
  attack: 'true',
  atk_dmg: {
    1=> '1d8',
    5=> '2d8',
    11=> '3d8',
    17=> '4d8',
  },
  dmg_type: 'Cold',
  id: 272,
)

Spell.create(
  name: "Ray of Sickness",
  level: 1,
  description: "A ray of sickening greenish energy lashes out toward a creature within range. Make a ranged spell attack against the target. On a hit, the target takes 2d8 poison damage and must make a Constitution saving throw. On a failed save, it is also poisoned until the end of your next turn.

At Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d8 for each slot level above 1st.",
  school: 'necromancy',
  range: '60 feet',
  attack: 'true',
  atk_dmg: {
    1=> '2d8',
  },
  dmg_type: '',
  id: 273,
)

Spell.create(
  name: "Regenerate",
  level: 7,
  description: "You touch a creature and stimulate its natural healing ability. The target regains 4d8 + 15 hit points. For the duration of the spell, the target regains 1 hit point at the start of each of its turns (10 hit points each minute).

The target's severed body members (fingers, legs, tails, and so on), if any, are restored after 2 minutes. If you have the severed part and hold it to the stump, the spell instantaneously causes the limb to knit to the stump.",
  school: 'transmutation',
  range: 'Touch',
  cast_time: '1 minute',
  components: ['V','S','M (a prayer wheel and holy water)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 274,
)

Spell.create(
  name: "Reincarnate",
  level: 5,
  description: "You touch a dead humanoid or a piece of a dead humanoid. Provided that the creature has been dead no longer than 10 days, the spell forms a new adult body for it and then calls the soul to enter that body. If the target's soul isn't free or willing to do so, the spell fails.

The magic fashions a new body for the creature to inhabit, which likely causes the creature's race to change. The DM rolls a d100 and consults the PHB to determine what form the creature takes when restored to life, or the DM chooses a form.

The reincarnated creature recalls its former life and experiences. It retains the capabilities it had in its original form, except it exchanges its original race for the new one and changes its racial traits accordingly.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (rare oils and unguents worth at least 1,000 gp, which the spell consumes)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 275,
)

Spell.create(
  name: "Remove Curse",
  level: 3,
  description: "At your touch, all curses affecting one creature or object end. If the object is a cursed magic item, its curse remains, but the spell breaks its owner's attunement to the object so it can be removed or discarded.",
  school: 'abjuration',
  range: 'Touch',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 276,
)

Spell.create(
  name: "Resistance",
  level: 0,
  description: "You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one saving throw of its choice. It can roll the die before or after the saving throw. The spell then ends.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S','M (a miniature cloak)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 277,
)

Spell.create(
  name: "Resurrection",
  level: 7,
  description: "You touch a dead creature that has been dead for no more than a century, that didn't die of old age, and that isn't undead. If its soul is free and willing, the target returns to life with all its hit points.

This spell neutralizes any poisons and cures normal diseases afflicting the creature when it died. It doesn't, however, remove magical diseases, curses, and the like, if such affects aren't removed prior to casting the spell, they afflict the target on its return to life.

This spell closes all mortal wounds and restores any missing body parts.

Coming back from the dead is an ordeal. The target takes a -4 penalty to all attack rolls, saving throws, and ability checks. Every time the target finishes a long rest, the penalty is reduced by 1 until it disappears.

Casting this spell to restore life to a creature that has been dead for one year or longer taxes you greatly. Until you finish a long rest, you can't cast spells again, and you have disadvantage on all attack rolls, ability checks, and saving throws.",
  school: 'necromancy',
  cast_time: '1 hour',
  range: 'TOuch',
  components: ['V','S','M (a diamond worth at least 1,000 gp, which the spell consumes)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 278
)

Spell.create(
  name: "Reverse Gravity",
  level: 7,
  description: "This spell reverses gravity in a 50-foot-radius, 100-foot high cylinder centered on a point within range. All creatures and objects that aren't somehow anchored to the ground in the area fall upward and reach the top of the area when you cast this spell. A creature can make a Dexterity saving throw to grab onto a fixed object it can reach, thus avoiding the fall.

If some solid object (such as a ceiling) is encountered in this fall, falling objects and creatures strike it just as they would during a normal downward fall. If an object or creature reaches the top of the area without striking anything, it remains there, oscillating slightly, for the duration.

At the end of the duration, affected objects and creatures fall back down.",
  school: 'transmutation',
  range: '100 feet',
  components: ['V','S','M (a lodestone and iron filings)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 279
)

Spell.create(
  name: "Revivify",
  level: 3,
  description: "You touch a creature that has died within the last minute. That creature returns to life with 1 hit point. This spell can't return to life a creature that has died of old age, nor can it restore any missing body parts.",
  school: 'necromancy',
  range: 'Touch',
  components: ['V','S','M (a diamond worth 300 gp, which the spell consumes)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 280,
)

Spell.create(
  name: "Rope Trick",
  level: 2,
  description: "You touch a length of rope that is up to 60 feet long. One end of the rope then rises into the air until the whole rope hangs perpendicular to the ground. At the upper end of the rope, an invisible entrance opens to an extradimensional space that lasts until the spell ends.

The extradimensional space can be reached by climbing to the top of the rope. The space can hold as many as eight Medium or smaller creatures. The rope can be pulled into the space, making the rope disappear from view outside the space.

Attacks and spells can't cross through the entrance into or out of the extradimensional space, but those inside can see out of it as if through a 3-foot-by-5-foot window centered on the rope.

Anything inside the extradimensional space drops out when the spell ends.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (powdered corn extract and a twisted loop of parchment)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 281,
)

Spell.create(
  name: "Sacred Flame",
  level: 0,
  description: "Flame-like radiance descends on a creature that you can see within range. The target must succeed on a Dexterity saving throw or take 1d8 radiant damage. The target gains no benefit from cover for this saving throw.

The spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  school: 'evocation',
  range: '60 feet',
  attack: 'true',
  atk_dmg: {
    1=> '1d8',
    5=> '2d8',
    11=> '3d8',
    17=> '4d8',
  },
  dmg_type: 'Radiant',
  id: 282,
)

Spell.create(
  name: "Sanctuary",
  level: 1,
  description: "You ward a creature within range against attack. Until the spell ends, any creature who targets the warded creature with an attack or a harmful spell must first make a Wisdom saving throw. On a failed save, the creature must choose a new target or lose the attack or spell. This spell doesn't protect the warded creature from area effects, such as the explosion of a fireball.

If the warded creature makes an attack or casts a spell that affects an enemy creature, this spell ends.",
  school: 'abjuration',
  range: '30 feet',
  cast_time: '1 bonus action',
  components: ['V','S','M (a small silver mirror)'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 283,
)

Spell.create(
  name: "Scorching Ray",
  level: 2,
  description: "You create three rays of fire and hurl them at targets within range. You can hurl them at one target or several.

Make a ranged spell attack for each ray. On a hit, the target takes 2d6 fire damage.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, you create one additional ray for each slot level above 2nd.",
  school: 'evocation',
  range: '120 feet',
  attack: 'true',
  atk_dmg: {
    1=> '2d6',
  },
  dmg_type: 'Fire',
  id: 284,
)

Spell.create(
  name: "Scrying",
  level: 5,
  description: "You can see and hear a particular creature you choose that is on the same plane of existence as you. The target must make a Wisdom saving throw, which is modified by how well you know the target and the sort of physical connection you have to it. If a target knows you're casting this spell, it can fail the saving throw voluntarily if it wants to be observed.

On a successful save, the target isn't affected, and you can't use this spell against it again for 24 hours.

On a failed save, the spell creates an invisible sensor within 10 feet of the target. You can see and hear through the sensor as if you were there. The sensor moves with the target, remaining within 10 feet of it for the duration. A creature that can see invisible objects sees the sensor as a luminous orb about the size of your fist.

Instead of targeting a creature, you can choose a location you have seen before as the target of this spell. When you do, the sensor appears at that location and doesn't move.",
  school: 'divination',
  cast_time: '10 minutes',
  components: ['V','S','M (a focus worth at least 1,000 gp, such as a crystal ball, a silver mirror, or a font filled with holy water)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 285,
)

Spell.create(
  name: "Searing Smite",
  level: 1,
  description: "The next time you hit a creature with a melee weapon attack during the spell’s duration, your weapon flares with white-hot intensity, and the attack deals an extra 1d6 fire damage to the target and causes the target to ignite in flames.

At the start of each of its turns until the spell ends, the target must make a Constitution saving throw. On a failed save, it takes 1d6 fire damage. On a successful save, the spells ends. If the target or a creature within 5 feet of it uses an action to put out the flames, or if some other effect douses the flames (such as the target being submerged in water), the spell ends.

At Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the initial extra damage dealt by the attack increases by 1d6 for each slot.",
  school: 'evocation',
  components: ['V'],
  cast_time: '1 bonus action',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 286,
)

Spell.create(
  name: "See Invisibility",
  level: 2,
  description: "For the duration, you see invisible creatures and objects as if they were visible, and you can see into the Ethereal Plane. Ethereal creatures and objects appear ghostly and translucent.",
  school: 'divination',
  components: ['V','S','M (a pinch of talc and a small sprinkling of powdered silver)'],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 287
)

Spell.create(
  name: "Seeming",
  level: 5,
  description: "This spell allows you to change the appearance of any number of creatures that you can see within range. You give each target you choose a new, illusory appearance. An unwilling target can make a Charisma saving throw, and if it succeeds, it is unaffected by this spell.

The spell disguises physical appearances as well as clothing, armor, weapons, and equipment. You can make each creature seem 1 foot shorter or taller and appear thin, fat, or in-between. You can't change a target's body type, so you must choose a form that has the same basic arrangement of limbs. Otherwise, the extent of the illusion is up to you. The spell lasts for the duration, unless you use your action to dismiss it sooner.

The changes wrought by this spell fail to hold up to physical inspections. For example, if you use this spell to add a hat to a creature's outfit objects pass through the hat, and anyone who touches it would feel nothing or would feel the creature's head and hair. If you use this spell to appear thinner then you are, the hand of someone who reaches out to touch you would bump into you while it was seemingly still in midair.

A creature can use its action to inspect a target and make an Intelligence (Investigation) check against your spell save DC. If it succeeds, it becomes aware that the target is disguised.",
  school: 'illusion',
  range: '30 feet',
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 288,
)

Spell.create(
  name: "Sending",
  level: 3,
  description: "You send a short message of twenty-five words or less to a creature with you are familiar. The creature hears the message in its mind, recognizes you as the sender if it knows you, and can answer in a like manner immediately. The spell enables creatures with Intelligence scores of at least 1 to understand the meaning of your message.

You can send the message across any distance and even to other planes of existence, but if the target is on a different plane than you, there is a 5 percent chance that the message doesn't arrive.",
  school: 'evocation',
  range: 'Unlimited',
  components: ['V','S','M (a short piece of fine copper wire)'],
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 289,
)

Spell.create(
  name: "Sequester",
  level: 7,
  description: "By means of this spell, a willing creature or an object can be hidden away, safe from detection for the duration. When you cast the spell and touch the target, it becomes invisible and can't be targeted by divination spells or perceived through scrying sensors created by the divination of spells.

If the target is a creature, it falls into a state of suspended animation. Time ceases to flow for it, and it doesn't grow older.

You can set a condition for the spell to end early. The condition can be anything you choose, but it must occur or be visible within 1 mile of the target. Examples include after 1,000 years or when the tarrasque awakes. This spells also ends if the target takes any damage.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (a powder composed of diamond, emerald, ruby, and sapphire dust worth at least 5,000 gp, which the spell consumes)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 290,
)

Spell.create(
  name: "Shapechange",
  level: 9,
  description: "You assume the form of a different creature for the duration. The new form can be any creature with a challenge rating equal to your level or lower. The creature can't be a construct or an undead, and you must have seen the sort of creature at least once. You transform into an average example of that creature, one without any class levels or the Spellcasting trait.

Your game statistics are replaced by the statistics of the chosen creature, though you retain your alignment and Intelligence, Wisdom, and Charisma scores. You also retain all of your skill and saving throw proficiencies, in addition to gaining those of the creature. If the creature has the same proficiency as you, and the bonus listed in its statistics is higher than yours, use the creature's bonus in place of yours. You can't use any legendary actions or lair actions of the new form.

You assume the hit points and Hit Dice of the new form. When you revert to your normal, you return to the number of hit points you had before you transformed. If you revert as a result of dropping to 0 hit points, any excess damage carries over to your normal form. As long as the excess damage doesn't reduce your normal form to 0 hit points, you aren't knocked unconscious.

You retain the benefit of any features from your class, race, or other source and can use them, provided that your new form is physically capable of doing so. You can't use any special senses you have (for example, darkvision) unless your new form also has that sense. You can only speak if the creature can normally speak.

When you transform, you choose whether your equipment falls to the ground, merges into the new form, or is worn by it. Worn equipment functions as normal. The DM determines whether it is practical for the new form to wear a piece of equipment, based on the creature's shape and size. Your equipment doesn't change shape or size to match the new form, and any equipment that the new form can't wear must either fall to the ground or merge into your new form. Equipment that merges has no effect in that state.

During this spell's duration, you can use your action to assume a different form following the same restrictions and rules for the original form, with one exception - if your new form has more hit points than your current one, your hit points remain at their current value.",
  school: 'transmutation',
  components: ['V','S','M (a jade circlet worth at least 1,500 gp, which you must place on your head before you cast the spell)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 291,
)

Spell.create(
  name: "Shatter",
  level: 2,
  description: "A sudden loud ringing noise, painfully intense, erupts from a point of your choice within range. Each creature in a 10-foot-radius sphere centered on that point must make a Constitution saving throw. A creature takes 3d8 thunder damage on a failed save, or half as much damage on a successful one. A creature made of inorganic material such as stone, crystal, or metal has disadvantage on this saving throw.

A nonmagical object that isn't being worn or carried also takes the damage if it's in the spell's area.

At Higher Levels: When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 1d8 for each slot level above 2nd.",
  school: 'evocation',
  range: '60 feet',
  components: ['V','S','M (a chip of mica)'],
  attack: 'true',
  atk_dmg: {
    1=> '3d8',
  },
  dmg_type: 'Thunder',
  id: 292,
)

Spell.create(
  name: "Shield",
  level: 1,
  description: "An invisible barrier of magical force appears and protects you. Until the start of your next turn, you have a +5 bonus to AC, including against the triggering attack, and you take no damage from magic missile.",
  school: 'abjuration',
  cast_time: '1 reaction',
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 293,
)

Spell.create(
  name: "Shield of Faith",
  level: 1,
  description: "A shimmering field appears and surrounds a creature of your choice within range, granting it a +2 bonus to AC for the duration.",
  school: 'abjuration',
  cast_time: '1 bonus action',
  range: '60 feet',
  components: ['V','S','M (a small parchment with a bit of holy text written on it)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 294,
)

Spell.create(
  name: "Shillelagh",
  level: 0,
  description: "The wood of a club or quarterstaff you are holding is imbued with nature's power. For the duration, you can use your spellcasting ability instead of Strength for the attack and damage rolls of melee attacks using that weapon, and the weapon's damage die becomes a d8. The weapon also becomes magical, if it isn't already. The spell ends if you cast it again or if you let go of the weapon.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (mistletoe, a shamrock leaf, and a club or quarterstaff)'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 295,
)

Spell.create(
  name: "Shocking Grasp",
  level: 0,
  description: "Lightning springs from your hand to deliver a shock to a creature you try to touch. Make a melee spell attack against the target. You have advantage on the attack roll if the target is wearing armor made of metal. On a hit, the target takes 1d8 lightning damage, and it can't take reactions until the start of its next turn.

The spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  school: 'evocation',
  range: 'Touch',
  attack: 'true',
  atk_dmg: {
    1=> '1d8',
    5=> '2d8',
    11=> '3d8',
    17=> '4d8',
  },
  dmg_type: 'Lightning',
  id: 296,
)

Spell.create(
  name: "Silence",
  level: 2,
  description: "For the duration, no sound can be created within or pass through a 20-foot-radius sphere centered on a point you choose within range. Any creature or object entirely inside the sphere is immune to thunder damage, and creatures are deafened while entirely inside it. Casting a spell that includes a verbal component is impossible there.",
  school: 'illusion',
  ritual: 1,
  range: '120 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 297,
)

Spell.create(
  name: "Silent Image",
  level: 1,
  description: "You create the image of an object, a creature, or some other visible phenomenon that is no larger than a 15-foot cube. The image appears at a spot within range and lasts for the duration. The image is purely visual, it isn't accompanied by sound, smell, or other sensory effects.

You can use your action to cause the image to move to any spot within range. As the image changes location, you can alter its appearance so that its movements appear natural for the image. For example, if you create an image of a creature and move it, you can alter the image so that it appears to be walking.

Physical interaction with the image reveals it to be an illusion, because things can pass through it. A creature that uses its action to examine the image can determine that it is an illusion with a successful Intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the creature can see through the image.",
  school: 'illusion',
  range: '60 feet',
  components: ['V','S','M (a bit of fleece)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 298,
)

Spell.create(
  name: "Simulacrum",
  level: 7,
  description: "You shape an illusory duplicate of one beast or humanoid that is within range for the entire casting time of the spell. The duplicate is a creature, partially real and formed from ice or snow, and it can take actions and otherwise be affected as a normal creature. It appears to be the same as the original, but it has half the creature's hit point maximum and is formed without any equipment. Otherwise, the illusion uses all the statistics of the creature it duplicates.

The simulacrum is friendly to you and creatures you designate. It obeys your spoken commands, moving and acting in accordance with your wishes and acting on your turn in combat. The simulacrum lacks the ability to learn or become more powerful, so it never increases its level or other abilities, nor can it regain expended spell slots.

If the simulacrum is damaged, you can repair it in an alchemical laboratory, using rare herbs and minerals worth 100 gp per hit point it regains. The simulacrum lasts until it drops to 0 hit points, at which point it reverts to snow and melts instantly.

If you cast this spell again, any currently active duplicates you created with this spell are instantly destroyed.",
  school: 'illusion',
  cast_time: '12 hours',
  range: 'Touch',
  components: ['V','S','M (Snow or ice in quantities sufficient to made a life-size copy of the duplicated creature; some hair, fingernail clippings, or other piece of that creature’s body placed inside the snow or ice; and powdered ruby worth 1,500 gp, sprinkled over the duplicate and consumed by the spell)'],
  duration: 'Until dispelled',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 299,
)

Spell.create(
  name: "Sleep",
  level: 1,
  description: "This spell sends creatures into a magical slumber. Roll 5d8, the total is how many hit points of creatures this spell can affect. Creatures within 20 feet of a point you choose within range are affected in ascending order of their current hit points (ignoring unconscious creatures).

Starting with the creature that has the lowest current hit points, each creature affected by this spell falls unconscious until the spell ends, the sleeper takes damage, or someone uses an action to shake or slap the sleeper awake. Subtract each creature's hit points from the total before moving on to the creature with the next lowest hit points. A creature's hit points must be equal to or less than the remaining total for that creature to be affected.

Undead and creatures immune to being charmed aren't affected by this spell.

At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, roll an additional 2d8 for each slot level above 1st.",
  school: 'enchantment',
  range: '90 feet',
  components: ['V','S','M (a pinch of fne sand, rose petals, or a cricket)'],
  duration: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 300,
)

Spell.create(
  name: "Sleet Storm",
  level: 3,
  description: "Until the spell ends, freezing rain and sleet fall in a 20-foot-tall cylinder with a 40-foot radius centered on a point you choose within range. The area is heavily obscured, and exposed flames in the area are doused.

The ground in the area is covered with slick ice, making it difficult terrain. When a creature enters the spell's area for the first time on a turn or starts its turn there, it must make a Dexterity saving throw. On a failed save, it falls prone.

If a creature is concentrating in the spell's area, the creature must make a successful Constitution saving throw against your spell save DC or lose concentration.",
  school: 'conjuration',
  range: '150 feet',
  components: ['V','S','M (a pinch of dust and a few drops of water)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 301,
)

Spell.create(
  name: "Slow",
  level: 3,
  description: "You alter time around up to six creatures of your choice in a 40-foot cube within range. Each target must succeed on a Wisdom saving throw or be affected by this spell for the duration.

An affected target's speed is halved, it takes a -2 penalty to AC and Dexterity saving throws, and it can't use reactions. On its turn, it can use either an action or a bonus action, not both. Regardless of the creature's abilities or magic items, it can't make more than one melee or ranged attack during its turn.

If the creature attempts to cast a spell with a casting time of 1 action, roll a d20. On an 11 or higher, the spell doesn't take effect until the creature's next turn, and the creature must use its action on that turn to complete the spell. If it can't, the spell is wasted.

A creature affected by this spell makes another Wisdom saving throw at the end of its turn. On a successful save, the effect ends for it.",
  school: 'transmutation',
  range: '120 feet',
  components: ['V','S','M (a drop of molasses)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 302,
)

Spell.create(
  name: "Spare the Dying",
  level: 0,
  description: "You touch a living creature that has 0 hit points. The creature becomes stable. This spell has no effect on undead or constructs.",
  school: 'necromancy',
  range: 'Touch',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 303,
)

Spell.create(
  name: "Speak with Animals",
  level: 1,
  description: "You gain the ability to comprehend and verbally communicate with beasts for the duration. The knowledge and awareness of many beasts is limited by their intelligence, but at minimum, beasts can give you information about nearby locations and monsters, including whatever they can perceive or have perceived within the past day. You might be able to persuade a beast to perform a small favor for you, at the DM's discretion.",
  school: 'divination',
  ritual: 1,
  duration: '10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 304,
)

Spell.create(
  name: "Speak with Dead",
  level: 3,
  description: "You grant the semblance of life and intelligence to a corpse of your choice within range, allowing it to answer the questions you pose. The corpse must still have a mouth and can't be undead. The spell fails if the corpse was the target of this spell within the last 10 days.

  Until the spell ends, you can ask the corpse up to five questions. The corpse knows only what it knew in life, including the languages it knew. Answers are usually brief, cryptic, or repetitive, and the corpse is under no compulsion to offer a truthful answer if you are hostile to it or it recognizes you as an enemy. This spell doesn't return the creature's soul to its body, only its animating spirit. Thus, the corpse can't learn new information, doesn't comprehend anything that has happened since it died, and can't speculate about future events.",
  school: 'necromancy',
  range: '10 feet',
  components: ['V','S','M (burning incense)'],
  duration: '10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 305,
)

Spell.create(
  name: "Speak with Plants",
  level: 3,
  description: "You imbue plants within 30 feet of you with limited sentience and animation, giving them the ability to communicate with you and follow your simple commands. You can question plants about events in the spell's area within the past day, gaining information about creatures that have passed, weather, and other circumstances.

  You can also turn difficult terrain caused by plant growth (such as thickets and undergrowth) into ordinary terrain that lasts for the duration. Or you can turn ordinary terrain where plants are present into difficult terrain that lasts for the duration, causing vines and branches to hinder pursuers, for example.

  Plants might be able to perform other tasks on your behalf, at the DM's discretion. The spell doesn't enable plants to uproot themselves and move about, but they can freely move branches, tendrils, and stalks.

  If a plant creature is in the area, you can communicate with it as if you shared a common language, but you gain no magical ability to influence it.

  This spell can cause the plants created by the entangle spell to release a restrained creature.",
  school: 'transmutation',
  range: 'Self (30-foot radius)',
  duration: '10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 306,
)

Spell.create(
  name: "Spider Climb",
  level: 2,
  description: "Until the spell ends, one willing creature you touch gains the ability to move up, down, and across vertical surfaces and upside down along ceilings, while leaving its hands free. The target also gains a climbing speed equal to its walking speed.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (a drop of bitumen and a spider)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 307,
)

Spell.create(
  name: "Spike Growth",
  level: 2,
  description: "The ground in a 20-foot radius centered on a point within range twists and sprouts hard spikes and thorns. The area becomes difficult terrain for the duration. When a creature moves into or within the area, it takes 2d4 piercing damage for every 5 feet it travels.

  The transformation of the ground is camouflaged to look natural. Any creature that can't see the area at the time the spell is cast must make a Wisdom (Perception) check against your spell save DC to recognize the terrain as hazardous before entering it.",
  school: 'transmutation',
  range: '150 feet',
  components: ['V','S','M (seven sharp thorns or seven small twigs, each sharpened to a point)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 308,
)

Spell.create(
  name: "Spirit Guardians",
  level: 3,
  description: "You call forth spirits to protect you. They flit around you to a distance of 15 feet for the duration. If you are good or neutral, their spectral form appears angelic or fey (your choice). If you are evil, they appear fiendish.

  When you cast this spell, you can designate any number of creatures you can see to be unaffected by it. An affected creature's speed is halved in the area, and when the creature enters the area for the first time on a turn or starts its turn there, it must make a Wisdom saving throw. On a failed save, the creature takes 3d8 radiant damage (if you are good or neutral) or 3d8 necrotic damage (if you are evil). On a successful save, the creature takes half as much damage.

  At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d8 for each slot level above 3rd.",
  school: 'conjuration',
  range: 'Self (15-foot radius)',
  components: ['V','S','M (a holy symbol)'],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 309,
)

Spell.create(
  name: "Spiritual Weapon",
  level: 2,
  description: "You create a floating, spectral weapon within range that lasts for the duration or until you cast this spell again. When you cast the spell, you can make a melee spell attack against a creature within 5 feet of the weapon. On a hit, the target takes force damage equal to 1d8 + your spellcasting ability modifier.

  As a bonus action on your turn, you can move the weapon up to 20 feet and repeat the attack against a creature within 5 feet of it.

  The weapon can take whatever form you choose. Clerics of deities who are associated with a particular weapon (as St. Cuthbert is known for his mace and Thor for his hammer) make this spell's effect resemble that weapon.

  At Higher Levels: When you cast this spell using a spell slot 3rd level of or higher, the damage increases by 1d8 for every two slot levels above the 2nd.",
  school: 'evocation',
  range: '60 feet',
  duration: '1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '1d8 + spell mod',
  },
  dmg_type: 'Force',
  id: 310,
)

Spell.create(
  name: "Staggering Smite",
  level: 4,
  description: "The next time you hit a creature with a melee weapon attack during this spell’s duration, your weapon pierces both body and mind, and the attack deals an extra 4d6 psychic damage to the target. The target must make a Wisdom saving throw. On a failed save, it has disadvantage on attack rolls and ability checks, and can’t take reactions, until the end of its next turn.",
  school: 'evocation',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 311,
)

Spell.create(
  name: "Stinking Cloud",
  level: 3,
  description: "You create a 20-foot-radius sphere of yellow, nauseating gas centered on a point within range. The cloud spreads around corners, and its area is heavily obscured. The cloud lingers in the air for the duration.

  Each creature that is completely within the cloud at the start of its turn must make a Constitution saving throw against poison. On a failed save, the creature spends its action that turn retching and reeling. Creatures that don't need to breathe or are immune to poison automatically succeed on this saving throw.

  A moderate wind (at least 10 miles per hour) disperses the cloud after 4 rounds. A strong wind (at least 20 miles per hour) disperses it after 1 round.",
  school: 'conjuration',
  range: '90 feet',
  components: ['V','S','M (a rotten egg or several skunk cabbage leaves)'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 312,
)

Spell.create(
  name: "Stone Shape",
  level: 4,
  description: "You touch a stone object of Medium size or smaller or a section of stone no more than 5 feet in any dimension and form it into any shape that suits your purpose. So, for example, you could shape a large rock into a weapon, idol, or coffer, or make a small passage through a wall, as long as the wall is less than 5 feet thick. You could also shape a stone door or its frame to seal the door shut. The object you create can have up to two hinges and a latch, but finer mechanical detail isn't possible.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S','M (soft clay, which must be worked into roughly the dsired shape of the stoe object)'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 313,
)

Spell.create(
  name: "Stoneskin",
  level: 4,
  description: "This spell turns the flesh of a willing creature you touch as hard as stone. Until the spell ends, the target has resistance to nonmagical bludgeoning, piercing, and slashing damage.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S','M (diamond dust worth 100 gp, which the spell consumes)'],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 314,
)

Spell.create(
  name: "Storm of Vengeance",
  level: 9,
  description: "A churning storm cloud forms, centered on a point you can see and spreading to a radius of 360 feet. Lightning flashes in the area, thunder booms, and strong winds roar. Each creature under the cloud (no more than 5,000 feet beneath the cloud) when it appears must make a Constitution saving throw. On a failed save, a creature takes 2d6 thunder damage and becomes deafened for 5 minutes.

  Each round you maintain concentration on this spell, the storm produces additional effects on your turn.

  Round 2: Acidic rain falls from the cloud. Each creature and object under the cloud takes 1d6 acid damage.

  Round 3: You call six bolts of lightning from the cloud to strike six creatures or objects of your choice beneath the cloud. A given creature or object can't be struck by more than one bolt. A struck creature must make a Dexterity saving throw. The creature takes 10d6 lightning damage on a failed save, or half as much damage on a successful one.

  Round 4: Hailstones rain down from the cloud. Each creature under the cloud takes 2d6 bludgeoning damage.

  Round 5-10: Gusts and freezing rain assail the area under the cloud. the area becomes difficult terrain and is heavily obscured. Each creature there takes 1d6 cold damage. Ranged weapon attacks in the area are impossible. The wind and rain count as a severe distraction for the purposes of maintaining concentration on spells. Finally, gusts of strong wind (ranging from 20 to 50 miles per hour) automatically disperse fog, mists, and similar phenomena in the area whether mundane or magical.",
  school: 'conjuration',
  range: 'Sight',
  duration: 'Concentration, Up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> 'Epic',
  },
  dmg_type: 'Mixed',
  id: 315,
)

Spell.create(
  name: "Suggestion",
  level: 2,
  description: "You suggest a course of activity (limited to a sentence or two) and magically influence a creature you can see within range that can hear and understand you. Creatures that can't be charmed are immune to this effect. The suggestion must be worded in such a manner as to make the course of action sound reasonable. Asking the creature to stab itself, throw itself onto a spear, immolate itself, or do some other obviously harmful act ends the spell.

  The target must make a Wisdom saving throw. On a failed save, it pursues the course of action you described to the best of its ability. The suggested course of action can continue for the entire duration. If the suggested activity can be completed in a shorter time, the spell ends when the subject finishes what it was asked to do.

  You can also specify conditions that will trigger a special activity during the duration. For example, you might suggest that a knight give her warhorse to the first beggar she meets. If the condition isn't met before the spell expires, the activity isn't performed.

  If you or any of your companions damage the target, the spell ends.",
  school: 'enchantment',
  range: '30 feet',
  components: ['V',"M (a snake's tongue and either a bit of honeycomb or a drop of sweet oil)"],
  duration: 'Concentration, up to 8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 316,
)

Spell.create(
  name: "Sunbeam",
  level: 6,
  description: "A beam of brilliant light flashes out from your hand in a 5-foot-wide, 60-foot-line. Each creature in the line must make a Constitution saving throw. On a failed save, a creature takes 6d8 radiant damage and is blinded until your next turn. On a successful save, it takes half as much damage and isn't blinded by this spell. Undead and oozes have disadvantage on this saving throw.

  You can create a new line of radiance as your action on any turn until the spell ends.

  For the duration, a mote of brilliant radiance shines in your hand. It sheds bright light in a 30-foot radius and dim light for an additional 30 feet. The light is sunlight.",
  school: 'evocation',
  range: 'Self (60-foot line)',
  components: ['V','S',"M (a magnifying glass)"],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '6d8',
  },
  dmg_type: 'Radiant',
  id: 317,
)

Spell.create(
  name: "Sunburst",
  level: 8,
  description: "Brilliant sunlight flashes in a 60-foot radius centered on a point you choose within range. Each creature in that light must make a Constitution saving throw. On a failed save, a creature takes 12d6 radiant damage and is blinded for 1 minute. On a successful save, it takes half as much damage and isn't blinded by this spell. Undead and oozes have disadvantage on this saving throw.

  A creature blinded by this spell makes another Constitution saving throw at the end of each of its turns. On a successful save, it is no longer blinded.

  This spell dispels any darkness in its area that was created by a spell.",
  school: 'evocation',
  range: '150 feet',
  components: ['V','S',"M (fire and a piece of sunstone)"],
  attack: 'true',
  atk_dmg: {
    1=> '12d6',
  },
  dmg_type: 'Radiant',
  id: 318,
)

Spell.create(
  name: "Swift Quiver",
  level: 5,
  description: "You transmute your quiver so it produces an endless supply of nonmagical ammunition, which seems to leap into your hand when you reach for it.

  On each of your turns until the spell ends, you can use a bonus action to make two attacks with a weapon that uses ammunition from the quiver. Each time you make such a ranged attack, your quiver magically replaces the piece of ammunition you used with a similar piece of nonmagical ammunition. Any pieces of ammunition created by this spell disintegrate when the spell ends. If the quiver leaves your possession, the spell ends.",
  school: 'transmutation',
  range: 'Touch',
  components: ['V','S',"M (a quiver containing at least one piece of ammunition)"],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 319,
)

Spell.create(
  name: "Symbol",
  level: 7,
  description: "When you cast this spell, you inscribe a harmful glyph either on a surface (such as a section of floor, a wall, or a table) or within an object that can be closed to conceal the glyph (such as a book, a scroll, or a treasure chest). If you choose a surface, the glyph can cover an area of the surface no larger than 10 feet in diameter. If you choose an object, that object must remain in its place, if the object is moved more than 10 feet from where you cast this spell, the glyph is broken, and the spell ends without being triggered.

  The glyph is nearly invisible, requiring an Intelligence (Investigation) check against your spell save DC to find it.

  You decide what triggers the glyph when you cast the spell. For glyphs inscribed on a surface, the most typical triggers include touching or stepping on the glyph, removing another object covering it, approaching within a certain distance of it, or manipulating the object that holds it. For glyphs inscribed within an object, the most common triggers are opening the object, approaching within a certain distance of it, or seeing or reading the glyph.

  You can further refine the trigger so the spell is activated only under certain circumstances or according to a creature's physical characteristics (such as height or weight), or physical kind (for example, the ward could be set to affect hags or shapechangers). You can also specify creatures that don't trigger the glyph, such as those who say a certain password.

  When you inscribe the glyph, choose one of the options below for its effect. Once triggered, the glyph glows, filling a 60-foot-radius sphere with dim light for 10 minutes, after which time the spell ends. Each creature in the sphere when the glyph activates is targeted by its effect, as is a creature that enters the sphere for the first time on a turn or ends its turn there.

  Death, Discord, Fear, Hopelessness, Insanity, Pain, Sleep, Stunning",
  school: 'abjuration',
  range: 'Touch',
  cast_time: '1 minute',
  components: ['V','S',"M (mercury, phosphorous, and powdered diamond and opal with a total value of at least 1,000 gp, which the spell consumes)"],
  duration: 'Until dispelled or triggered',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 320,
)

Spell.create(
  name: "Tasha's Hideous Laughter",
  level: 1,
  description: "A creature of your choice that you can see within range perceives everything as hilariously funny and falls into fits of laugher if this spell affects it. The target must succeed on a Wisdom saving throw of fall prone, becoming incapacitated and unable to stand up for the duration. A creature with an Intelligence score of 4 or less isn't affected.

  At the end of each of its turns, and each time it takes damage, the target can make another Wisdom saving throw. The target has advantage on the saving throw if it's triggered by damage. On a success, the spell ends.",
  school: 'enchantment',
  range: '30 feet',
  components: ['V','S',"M (tiny tarts and a feather that is waved in the air)"],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 321,
)

Spell.create(
  name: "Telekinesis",
  level: 5,
  description: "You gain the ability to move or manipulate creatures or objects by thought. When you cast the spell, and as your action each round for the duration, you can exert your will on one creature or object that you can see within range, causing the appropriate effect below. You can affect the same target round after round, or choose a new one at any time. If you switch targets, the prior target is no longer affected by the spell.

  Creature: You can try to move a Huge or smaller creature. Make an ability check with your spellcasting ability contested by the creature's Strength check. If you win the contest, you move the creature up to 30 feet in any direction, including upward but not beyond the range of this spell. Until the end of your next turn, the creature is restrained in your telekinetic grip. A creature lifted upward is suspended in mid-air.

  On subsequent rounds, you can use your action to attempt to maintain your telekinetic grip on the creature by repeating the contest.

  Object: You can try to move an object that weighs up to 1,000 pounds. If the object isn't being worn or carried, you automatically move it up to 30 feet in any direction, but not beyond the range of this spell.

  If the object is worn or carried by a creature, you must make an ability check with your spellcasting ability contested by that creature's Strength check. If you succeed, you pull the object away from that creature and can move it up to 30 feet in any direction but not beyond the range of this spell.

  You can exert fine control on objects with your telekinetic grip, such as manipulating a simple tool, opening a door or a container, stowing or retrieving an item from an open container, or pouring the contents from a vial.",
  school: 'transmutation',
  range: '60 feet',
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 322,
)

Spell.create(
  name: "Telepathy",
  level: 8,
  description: "You create a telepathic link between yourself and a willing creature with which you are familiar. The creature can be anywhere on the same plane of existence as you. The spell ends if you or the target are no longer on the same plane.

  Until the spell ends, you and the target can instantaneously share words, images, sounds, and other sensory messages with one another through the link, and the target recognizes you as the creature it is communicating with. The spell enables a creature with an Intelligence score of at least 1 to understand the meaning of your words and take in the scope of any sensory messages you send to it.",
  school: 'evocation',
  range: 'Unlimited',
  components: ['V','S',"M (a pair of linked silver rings)"],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 323,
)

Spell.create(
  name: "Teleport",
  level: 7,
  description: "This spell instantly transports you and up to eight willing creatures of your choice that you can see within range, or a single object that you can see within range, to a destination you select. If you target an object, it must be able to fit entirely inside a 10-foot cube, and it can't be held or carried by an unwilling creature. The destination you choose must be known to you, and it must be on the same plane of existence as you. Your familiarity with the destination determines whether you arrive there successfully. The DM rolls d100 and consults the table.",
  school: 'conjuration',
  range: '10 feet',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 324,
)

Spell.create(
  name: "Teleportation Circle",
  level: 5,
  description: "As you cast the spell, you draw a 10-foot-diameter circle on the ground inscribed with sigils that link your location to a permanent teleportation circle of your choice whose sigil sequence you know and that is on the same plane of existence as you. A shimmering portal opens within the circle you drew and remains open until the end of your next turn. Any creature that enters the portal instantly appears within 5 feet of the destination circle or in the nearest unoccupied space if that space is occupied.

  Many major temples, guilds, and other important places have permanent teleportation circles inscribed somewhere within their confines. Each such circle includes a unique sigil sequence - a string of magical runes arranged in a particular pattern. When you first gain the ability to cast this spell, you learn the sigil sequences for two destinations on the Material Plane, determined by the DM. You can learn additional sigil sequences during your adventures⁠. You can commit a new sigil sequence to memory after studying it for 1 minute.

  You can create a permanent teleportation circle by casting this spell in the same location every day for one year. You need not use the circle to teleport⁠ when you cast the spell in this way.",
  school: 'conjuration',
  range: '10 feet',
  components: ['V',"M (rare chalks and inks infused with precious gems with 50 gp, which the spell consumes)"],
  duration: '1 round',
  cast_time: '1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 325,
)

Spell.create(
  name: "Tenser's Floating Disk",
  level: 1,
  description: "This spell creates a circular, horizontal plane of force, 3 feet in diameter and 1 inch thick, that floats 3 feet above the ground in an unoccupied space of your choice that you can see within range. The disk remains for the duration, and can hold up to 500 pounds. If more weight is placed on it, the spell ends, and everything on the disk falls to the ground.

  The disk is immobile while you are within 20 feet of it. If you move more than 20 feet away from it, the disk follows you so that it remains within 20 feet of you. It can more across uneven terrain, up or down stairs, slopes and the like, but it can't cross an elevation change of 10 feet or more. For example, the disk can't move across a 10-foot-deep pit, nor could it leave such a pit if it was created at the bottom.

  If you move more than 100 feet from the disk (typically because it can't move around an obstacle to follow you), the spell ends.",
  school: 'conjuration',
  range: '30 feet',
  components: ['V','S',"M (a drop of mercury)"],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 326,
)

Spell.create(
  name: "Thaumaturgy",
  level: 0,
  description: "You manifest a minor wonder, a sign of supernatural power, within range. You create one of the following magical effects within range.

  • Your voice booms up to three times as loud as normal for 1 minute.

  • You cause flames to flicker, brighten, dim, or change color for 1 minute.

  • You cause harmless tremors in the ground for 1 minute.

  • You create an instantaneous sound that originates from a point of your choice within range, such as a rumble of thunder, the cry of a raven, or ominous whispers.

  • You instantaneously cause an unlocked door or window to fly open or slam shut.

  • You alter the appearance of your eyes for 1 minute.

  If you cast this spell multiple times, you can have up to three of its 1-minute effects active at a time, and you can dismiss such an effect as an action.",
  school: 'transmutation',
  range: '30 feet',
  components: ['V'],
  duration: 'Up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 327,
)


Spell.create(
  name: "Thorn Whip",
  level: 0,
  description: "You create a long, vine-like whip covered in thorns that lashes out at your command toward a creature in range. Make a melee spell attack against the target. If the attack hits, the creature takes 1d6 piercing damage, and if the creature is Large or smaller, you pull the creature up to 10 feet closer to you.

  At Higher Levels. This spell’s damage increases by 1d6 when you reach 5th level (2d6), 11th level (3d6), and 17th level (4d6).",
  school: 'transmutation',
  range: '30 feet',
  components: ['V','S',"M (the stem of a plant with thorns)"],
  attack: 'true',
  atk_dmg: {
    1=> '1d6',
    5=> '2d6',
    11=> '3d6',
    17=> '4d6',
  },
  dmg_type: 'Piercing',
  id: 328,
)

Spell.create(
  name: "Thunderous Smite",
  level: 1,
  description: "The first time you hit with a melee weapon attack during this spell’s duration, your weapon rings with thunder that is audible within 300 feet of you, and the attack deals an extra 2d6 thunder damage to the target. Additionally, if the target is a creature, it must succeed on a Strength saving throw or be pushed 10 feet away from you and knocked prone.",
  school: 'evocation',
  cast_time: '1 bonus action',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 329,
)

Spell.create(
  name: "Thunderwave",
  level: 1,
  description: "A wave of thunderous force sweeps out from you. Each creature in a 15-foot cube originating from you must make a Constitution saving throw. On a failed save, a creature takes 2d8 thunder damage and is pushed 10 feet away from you. On a successful save, the creature takes half as much damage and isn't pushed.

  In addition, unsecured objects that are completely within the area of effect are automatically pushed 10 feet away from you by the spell's effect, and the spell emits a thunderous boom audible out to 300 feet.

  At Higher Levels: When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d8 for each slot level above 1st.",
  school: 'evocation',
  range: 'Self (15-foot cube)',
  attack: 'true',
  atk_dmg: {
    1=> '2d8',
  },
  dmg_type: 'Thunder',
  id: 330,
)

Spell.create(
  name: "Time Stop",
  level: 9,
  description: "You briefly stop the flow of time for everyone but yourself. No time passes for other creatures, while you take 1d4+1 turns in a row, during which you can use actions and move as normal.

  This spell ends if one of the actions you use during this period, or any effects that you create during this period, affects a creature other than you or an object being worn or carried by someone other than you. In addition, the spell ends if you move to a place more than 1,000 feet from the location where you cast it.",
  school: 'transmutation',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 331,
)

Spell.create(
  name: "Tongues",
  level: 3,
  description: "This spell grants the creature you touch the ability to understand any spoken language it hears. Moreover, when the target speaks, any creature that knows at least one language and can hear the target understands what it says.",
  school: 'divination',
  range: 'Touch',
  components: ['V',"M (a small clay model of a ziggurat)"],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 332,
)

Spell.create(
  name: "Transport via Plants",
  level: 6,
  description: "This spell creates a magical link between a Large or larger inanimate plant within range and another plant, at any distance, on the same plane of existence. You must have seen or touched the destination plant at least once before. For the duration, any creature can step into the target plant and exit from the destination plant by using 5 feet of movement.",
  school: 'conjuration',
  range: '10 feet',
  duration: '1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 333,
)

Spell.create(
  name: "Tree Stride",
  level: 5,
  description: "You gain the ability to enter a tree and move from inside it to inside another tree of the same kind within 500 feet. Both trees must be living and at least the same size as you. You must use 5 feet of movement to enter a tree. You instantly know the location of all other trees of the same kind within 500 feet and, as part of the move used to enter the tree, can either pass into one of those trees or step out of the tree you're in. You appear in a spot of your choice within 5 feet of the destination tree, using another 5 feet of movement. If you have no movement left, you appear within 5 feet of the tree you entered.

  You can use this transportation ability once per round for the duration. You must end each turn outside a tree.",
  school: 'conjuration',
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 334,
)

Spell.create(
  name: "True Polymorph",
  level: 9,
  description: "Choose one creature with at least 1 hit point or nonmagical object that you can see within range. You transform the creature into a different creature, the creature into an object, or the object into a creature (the object must be neither worn nor carried by another creature). The transformation lasts for the duration, or until the target drops to 0 hit points or dies. If you concentrate on this spell for the full duration, the transformation becomes permanent.

  Shapechangers aren't affected by this spell. An unwilling creature can make a Wisdom saving throw, and if it succeeds, it isn't affected by this spell.

  Creature into Creature: If you turn a creature into another kind of creature, the new form can be any kind you choose whose challenge rating is equal to or less than the target's (or its level, if the target doesn't have a challenge rating). The target's game statistics, including mental ability scores, are replaced by the statistics of the new form. It retains its alignment and personality.

  The target assumes the hit points of its new form, and when it reverts to its normal form, the creature returns to the number of hit points it had before it transformed. If it reverts as a result of dropping to 0 hit points, any excess damage carries over to its normal form. As long as the excess damage doesn't reduce the creature's normal form to 0 hit points, it isn't knocked unconscious.

  The creature is limited in the actions it can perform by the nature of its new form, and it can't speak, cast spells, or take any other action that requires hands or speech unless its new form is capable of such actions.

  The target's gear melds into the new form. The creature can't activate, use, wield, or otherwise benefit from any of its equipment.

  Object into Creature: You can turn an object into any kind of creature, as long as the creature's size is no larger than the object's size and the creature's challenge rating is 9 or lower. The creature is friendly to you and your companions. It acts on each of your turns. You decide what action it takes and how it moves. The DM has the creature's statistics and resolves all of its actions and movement.

  If the spell becomes permanent, you no longer control the creature. It might remain friendly to you, depending on how you have treated it.

  Creature into Object: If you turn a creature into an object, it transforms along with whatever it is wearing and carrying into that form. The creature's statistics become those of the object, and the creature has no memory of time spent in this form, after the spell ends and it returns to its normal form.",
  school: 'transmutation',
  range: '30 feet',
  components: ['V','S',"M (a drop of mercury, a dollop of gum arabic, and a wisp of smoke)"],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 335,
)

Spell.create(
  name: "True Resurrection",
  level: 9,
  description: "You touch a creature that has been dead for no longer than 200 years and that died for any reason except old age. If the creature's soul is free and willing, the creature is restored to life with all its hit points.

  This spell closes all wounds, neutralizes any poison, cures all diseases, and lifts any curses affecting the creature when it died. The spell replaces damaged or missing organs or limbs.

  The spell can even provide a new body if the original no longer exists, in which case you must speak the creature's name. The creature then appears in an unoccupied space you choose within 10 feet of you.",
  school: 'necromancy',
  range: 'Touch',
  components: ['V','S',"M (a sprinkle of holy water and diamonds worth at least 25,000 gp, which the spell consumes)"],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 336,
)

Spell.create(
  name: "True Seeing",
  level: 6,
  description: "This spell gives the willing creature you touch the ability to see things as they actually are. For the duration, the creature has truesight, notices secret doors hidden by magic, and can see into the Ethereal Plane, all out to a range of 120 feet.",
  school: 'divination',
  range: '30 feet',
  components: ['V','S',"M (an ointment for the eyes that costs 25 gp; is made from mushroom powder, saffron, and fat; and is consumed by the spell)"],
  duration: 'Concentration, up to 1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 337,
)

Spell.create(
  name: "True Strike",
  level: 0,
  description: "You extend your hand and point a finger at a target in range. Your magic grants you a brief insight into the target's defenses. On your next turn, you gain advantage on your first attack roll against the target, provided that this spell hasn't ended.",
  school: 'divination',
  range: '30 feet',
  components: ['S'],
  duration: 'Concentration, up to 1 round',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 338,
)

Spell.create(
  name: "Tsunami",
  level: 8,
  description: "A wall of water springs into existence at a point you choose within range. You can make the wall up to 300 feet long, 300 feet high, and 50 feet thick. The wall lasts for the duration.

  When the wall appears, each creature within its area must make a Strength saving throw. On a failed save, a creature takes 6d10 bludgeoning damage, or half as much damage on a successful save.

  At the start of each of your turns after the wall appears, the wall, along with any creatures in it, moves 50 feet away from you. Any Huge or smaller creature inside the wall or whose space the wall enters when it moves must succeed on a Strength saving throw or take 5d10 bludgeoning damage. A creature can take this damage only once per round. At the end of the turn, the wall’s height is reduced by 50 feet, and the damage creatures take from the spell on subsequent rounds is reduced by 1d10. When the wall reaches 0 feet in height, the spell ends.

  A creature caught in the wall can move by swimming. Because of the force of the wave, though, the creature must make a successful Strength (Athletics) check against your spell save DC in order to move at all. If it fails the check, it can’t move. A creature that moves out of the area falls to the ground.",
  school: 'conjuration',
  range: 'Sight',
  duration: 'Concentration, up to 6 rounds',
  attack: 'true',
  atk_dmg: {
    1=> '6d10',
  },
  dmg_type: 'Bludgeoning',
  id: 339,
)

Spell.create(
  name: "Unseen Servant",
  level: 1,
  description: "This spell creates an invisible, mindless, shapeless force that performs simple tasks at your command until the spell ends. The servant springs into existence in an unoccupied space on the ground within range. It has AC 10, 1 hit point, and a Strength of 2, and it can't attack. If it drops to 0 hit points, the spell ends.

  Once on each of your turns as a bonus action, you can mentally command the servant to move up to 15 feet and interact with an object. The servant can perform simple tasks that a human servant could do, such as fetching things, cleaning, mending, folding clothes, lighting fires, serving food, and pouring wine. Once you give the command, the servant performs the task to the best of its ability until it completes the task, then waits for your next command.

  If you command the servant to perform a task that would move it more than 60 feet away from you, the spell ends.",
  school: 'conjuration',
  ritual: 1,
  range: '60 feet',
  components: ['V','S',"M (a piece of string and a bit of wood)"],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 340,
)

Spell.create(
  name: "Vampiric Touch",
  level: 3,
  description: "The touch of your shadow-wreathed hand can siphon force from others to heal your wounds. Make a melee spell attack against a creature within your reach. On a hit, the target takes 3d6 necrotic damage, and you regain hit points equal to half the amount of necrotic damage dealt. Until the spell ends, you can make the attack again on each of your turns as an action.

  At Higher Levels: When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d6 for each slot level above 3rd.",
  school: 'necromancy',
  range: 'Self',
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '3d6',
  },
  dmg_type: 'Necrotic',
  id: 341,
)

Spell.create(
  name: "Vicious Mockery",
  level: 0,
  description: "You unleash a string of insults laced with subtle enchantments at a creature you can see within range. If the target can hear you (though it need not understand you), it must succeed on a Wisdom saving throw or take 1d4 psychic damage and have disadvantage on the next attack roll it makes before the end of its next turn.

  This spell's damage increases by 1d4 when you reach 5th level (2d4), 11th level (3d4), and 17th level (4d4).",
  school: 'enchantment',
  range: '60 feet',
  components: ['V'],
  attack: 'true',
  atk_dmg: {
    1=> '1d4',
    5=> '2d4',
    11=> '3d4',
    17=> '4d4',
  },
  dmg_type: 'Psychic',
  id: 342,
)

Spell.create(
  name: "Wall of Fire",
  level: 4,
  description: "You create a wall of fire on a solid surface within range. You can make the wall up to 60 feet long, 20 feet high, and 1 foot thick, or a ringed wall up to 20 feet in diameter, 20 feet high, and 1 foot thick. The wall is opaque and lasts for the duration.

  When the wall appears, each creature within its area must make a Dexterity saving throw. On a failed save, a creature takes 5d8 fire damage, or half as much damage on a successful save.

  One side of the wall, selected by you when you cast this spell, deals 5d8 fire damage to each creature that ends its turn within 10 feet of that side or inside the wall. A creature takes the same damage when it enters the wall for the first time on a turn or ends its turn there. The other side of the wall deals no damage.

  At Higher Levels: When you cast this spell using a spell slot of 5th level or higher, the damage increases by 1d8 for each slot level above 4th.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S',"M (a small piece of phosphorous)"],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '5d8',
  },
  dmg_type: 'Fire',
  id: 343,
)

Spell.create(
  name: "Wall of Force",
  level: 5,
  description: "An invisible wall of force springs into existence at a point you choose within range. The wall appears in any orientation you choose, as a horizontal or vertical barrier or at an angle. It can be free floating or resting on a solid surface. You can form it into a hemispherical dome or a sphere with a radius of up to 10 feet, or you can shape a flat surface made up of ten 10-foot-by-10-foot panels. Each panel must be contiguous with another panel. In any form, the wall is 1/4 inch thick. It lasts for the duration. If the wall cuts through a creature's space when it appears, the creature is pushed to one side of the wall (your choice which side).

  Nothing can physically pass through the wall. It is immune to all damage and can't be dispelled by dispel magic. A disintegrate spell destroys the wall instantly, however. The wall also extends into the Ethereal Plane, blocking ethereal travel through the wall.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S',"M (a pinch of powder made by crushing a clear gemstone)"],
  duration: 'Concentration, up to 10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 344,
)

Spell.create(
  name: "Wall of Ice",
  level: 6,
  description: "You create a wall of ice on a solid surface within range. You can form it into a hemispherical dome or a sphere with radius of up to 10 feet, or you can shape a flat surface made up of ten 10-foot-square panels. Each panel must be contiguous with another panel. In any form, the wall is 1 foot thick and lasts for the duration.

  If the wall cuts through a creature's space when it appears, the creature within its area is pushed to one side of the wall and must make a Dexterity saving throw. On a failed save, the creature takes 10d6 cold damage, or half as much damage on a successful save.

  The wall is an object that can be damaged and thus breached. It has AC 12 and 30 hit points per 10-foot section, and it is vulnerable to fire damage. Reducing a 10-foot section of wall to 0 hit points destroys it and leaves behind a sheet of frigid air in the space the wall occupied. A creature moving through the sheet of frigid air for the first time on a turn must make a Constitution saving throw. The creature takes 5d6 cold damage on a failed save, or half as much damage on a successful one.

  At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, the damage the wall deals when it appears increases by 2d6, and the damage from passing through the sheet of frigid air increases by 1d6 for each slot level above 6th.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S',"M (a small piece of quartz)"],
  duration: 'Concentration, up to 10 minutes',
  attack: 'true',
  atk_dmg: {
    1=> '10d6',
  },
  dmg_type: 'Cold',
  id: 345,
)

Spell.create(
  name: "Wall of Stone",
  level: 5,
  description: "A nonmagical wall of solid stone springs into existence at a point you choose within range. The wall is 6 inches thick and is composed of ten 10-foot-by-10-foot panels. Each panel must be contiguous with at least on other panel. Alternatively, you can create 10-foot-by-20-foot panels that are only 3 inches thick.

  If the wall cuts through a creature's space when it appears, the creature is pushed to one side of the wall (your choice). If a creature would be surrounded on all sides by the wall (or the wall and another solid surface), that creature can make a Dexterity saving throw. On a success, it can use its reaction to move up to its speed so that it is no longer enclosed by the wall.

  The wall can have any shape you desire, though it can't occupy the same space as a creature or object. the wall doesn't need to be vertical or resting on any firm foundation. It must, however, merge with and be solidly supported by existing stone. Thus you can use this spell to bridge a chasm or create a ramp.

  If you create a span greater than 20 feet in length, you must halve the size of each panel to create supports. You can crudely shape the wall to create crenellations, battlements, and so on.

  The wall is an object made of stone that can be damaged and thus breached. Each panel has AC 15 and 30 hit points per inch of thickness. Reducing a panel to 0 hit points destroys it and might cause connected panels to collapse at the DM's discretion.

  If you maintain your concentration on this spell for its whole duration, the wall becomes permanent and can't be dispelled. Otherwise, the wall disappears when the spell ends.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S',"M (a small block of granite)"],
  duration: 'Concentration, up to 10 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 346,
)

Spell.create(
  name: "Wall of Thorns",
  level: 6,
  description: "You create a wall of tough, pliable, tangled brush bristling with needle-sharp thorns. The wall appears within range on a solid surface and lasts for the duration. You choose to make the wall up to 60 feet long, 10 feet high, and 5 feet thick or a circle that has a 20-foot diameter and is up to 20 feet high and 5 feet thick. The wall blocks line of sight.

  When the wall appears, each creature within its area must make a Dexterity saving throw. On a failed save, a creature takes 7d8 piercing damage, or half as much damage on a successful save.

  A creature can move through the wall, albeit slowly and painfully. For every 1 foot a creature moves through the wall, it must spend 4 feet of movement. Furthermore, the first time a creature enters the wall on a turn or ends its turn there, the creature must make a Dexterity saving throw. It takes 7d8 slashing damage on a failed save, or half as much on a successful save.

  At Higher Levels: When you cast this spell using a spell slot of 7th level or higher, both types of damage increase by 1d8 for each slot level above 6th.",
  school: 'conjuration',
  range: '120 feet',
  components: ['V','S',"M (a handful of thorns)"],
  duration: 'Concentration, up to 10 minutes',
  attack: 'true',
  atk_dmg: {
    1=> '7d8',
  },
  dmg_type: 'Piercing',
  id: 347,
)

Spell.create(
  name: "Warding Bond",
  level: 2,
  description: "This spell wards a willing creature you touch and creates a mystic connection between you and the target until the spell ends. While the target is within 60 feet of you, it gains a +1 bonus to AC and saving throws, and it has resistance to all damage. Also, each time it takes damage, you take the same amount of damage.

  The spell ends if you drop to 0 hit points or if you and the target become separated by more than 60 feet. It also ends if the spell is cast again on either of the connected creatures. You can also dismiss the spell as an action.",
  school: 'abjuration',
  range: 'Touch',
  components: ['V','S',"M (a pair of platinum rings worth at least 50 gp each, which you and the target must wear for the duration)"],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 348,
)

Spell.create(
  name: "Water Breathing",
  level: 3,
  description: "This spell grants up to ten willing creatures you can see within range the ability to breathe underwater until the spell ends. Affected creatures also retain their normal mode of respiration.",
  school: 'transmutation',
  ritual: 1,
  range: '30 feet',
  components: ['V','S',"M (a short reed or piece of straw)"],
  duration: '24 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 349,
)

Spell.create(
  name: "Water Walk",
  level: 3,
  description: "This spell grants the ability to move across any liquid surface - such as water, acid, mud, snow, quicksand, or lava - as if it were harmless solid ground (creatures crossing molten lava can still take damage from the heat). Up to ten willing creatures you can see within range gain this ability for the duration.

  If your target a creature submerged in a liquid, the spell carries the target to the surface of the liquid at a rate of 60 feet per round.",
  school: 'transmutation',
  ritual: 1,
  range: '30 feet',
  components: ['V','S',"M (a piece of cork)"],
  duration: '1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 350,
)

Spell.create(
  name: "Web",
  level: 2,
  description: "You conjure a mass of thick, sticky webbing at a point of your choice within range. The webs fill a 20-foot cube from that point for the duration. The webs are difficult terrain and lightly obscure their area.

  If the webs aren't anchored between two solid masses (such as walls or trees) or layered across a floor, wall, or ceiling, the conjured web collapses on itself, and the spell ends at the start of your next turn. Webs layered over a flat surface have a depth of 5 feet.

  Each creature that starts its turn in the webs or that enters them during its turn must make a Dexterity saving throw. On a failed save, the creature is restrained as long as it remains in the webs or until it breaks free.

  A creature restrained by the webs can use its actions to make a Strength check against your spell save DC. If it succeeds, it is no longer restrained.

  The webs are flammable. Any 5-foot cube of webs exposed to fire burns away in 1 round, dealing 2d4 fire damage to any creature that starts its turn in the fire.",
  school: 'conjuration',
  range: '60 feet',
  components: ['V','S',"M (a bit of spiderweb)"],
  duration: 'Concentration, up to 1 hour',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 351,
)

Spell.create(
  name: "Weird",
  level: 9,
  description: "Drawing on the deepest fears of a group of creatures, you create illusory creatures in their minds, visible only to them. Each creature in a 30-foot-radius sphere centered on a point of your choice within range must make a Wisdom saving throw. On a failed save, a creature becomes frightened for the duration. The illusion calls on the creature's deepest fears, manifesting its worst nightmares as an implacable threat. At the end of each of the frightened creature's turns, it must succeed on a Wisdom saving throw or take 4d10 psychic damage. On a successful save, the spell ends for that creature.",
  school: 'illusion',
  range: '120 feet',
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '4d10',
  },
  dmg_type: '',
  id: 352,
)

Spell.create(
  name: "Wind Walk",
  level: 6,
  description: "You and up to ten willing creatures you can see within range assume a gaseous form for the duration, appearing as wisps of cloud. While in this cloud form, a creature has a flying speed of 300 feet and has resistance to damage from nonmagical weapons. The only actions a creature can take in this form are the Dash action or to revert to its normal form. Reverting takes 1 minute, during which time a creature is incapacitated and can't move. Until the spell ends, a creature can revert to cloud form, which also requires the 1-minute transformation.

  If a creature is in cloud form and flying when the effect ends, the creature descends 60 feet per round for 1 minute until it lands, which it does safely. If it can't land after 1 minute, the creature falls the remaining distance.",
  school: 'transmutation',
  range: '30 feet',
  components: ['V','S',"M (fire and holy water)"],
  duration: '8 hours',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 353,
)

Spell.create(
  name: "Wind Wall",
  level: 3,
  description: "A wall of strong wind rises from the ground at a point you choose within range. You can make the wall up to 50 feet long, 15 feet high, and 1 foot thick. You can shape the wall in any way you choose so long as it makes one continuous path along the ground. The wall lasts for the duration.

  When the wall appears, each creature within its area must make a Strength saving throw. A creature takes 3d8 bludgeoning damage on a failed save, or half as much damage on a successful one.

  The strong wind keeps fog, smoke, and other gases at bay. Small or smaller flying creatures or objects can't pass through the wall. Loose, lightweight materials brought into the wall fly upward. Arrows, bolts, and other ordinary projectiles launched at targets behind the wall are deflected upward and automatically miss. (Boulders hurled by giants or siege engines, and similar projectiles, are unaffected.) Creatures in gaseous form can't pass through it.",
  school: 'evocation',
  range: '120 feet',
  components: ['V','S',"M (a tiny fan and a feather of exotic origin)"],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '3d8',
  },
  dmg_type: 'Bludgeoning',
  id: 354,
)

Spell.create(
  name: "Wish",
  level: 9,
  description: "Wish is the mightiest spell a mortal creature can cast. By simply speaking aloud, you can alter the very foundations of reality in accord with your desires.

  The basic use of this spell is to duplicate any other spell of 8th level or lower. You don't need to meet any requirements in that spell, including costly components. The spell simply takes effect. Alternatively, you can create one of the following effects of your choice.

  • You create one object of up to 25,000 gp in value that isn't a magic item. The object can be no more than 300 feet in any dimension, and it appears in an unoccupied space you can see on the ground.

  • You allow up to twenty creatures that you can see to regain all hit points, and you end all effects on them described in the greater restoration spell.

  • You grant up to ten creatures that you can see resistance to a damage type you choose.

  • You grant up to ten creatures you can see immunity to a single spell or other magical effect for 8 hours. For instance, you could make yourself and all your companions immune to a lich's life drain attack.

  • You undo a single recent event by forcing a reroll of any roll made within the last round (including your last turn). Reality reshapes itself to accommodate the new result. For example, a wish spell could undo an opponent's successful save, a foe's critical hit, or a friend's failed save. You can force the reroll to be made with advantage or disadvantage, and you can choose whether to use the reroll or the original roll.

  You might be able to achieve something beyond the scope of the above examples. State your wish to the DM as precisely as possible. The DM has great latitude in ruling what occurs in such an instance, the greater the wish, the greater the likelihood that something goes wrong. This spell might simply fail, the effect you desire might only be partly achieved, or you might suffer some unforeseen consequence as a result of how you worded the wish. For example, wishing that a villain were dead might propel you forward in time to a period when that villain is no longer alive, effectively removing you from the game. Similarly, wishing for a legendary magic item or artifact might instantly transport you to the presence of the item's current owner.

  The stress of casting this spell to produce any effect other than duplicating another spell weakens you. After enduring that stress, each time you cast a spell until you finish a long rest, you take 1d10 necrotic damage per level of that spell. This damage can't be reduced or prevented in any way. In addition, your Strength drops to 3, if it isn't 3 or lower already, for 2d4 days. For each of those days that you spend resting and doing nothing more than light activity, your remaining recovery time decreases by 2 days. Finally, there is a 33 percent chance that you are unable to cast wish ever again if you suffer this stress.",
  school: 'conjuration',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 355,
)

Spell.create(
  name: "Witch Bolt",
  level: 1,
  description: "A beam of crackling, blue energy lances out toward a creature within range, forming a sustained arc of lightning between you and the target. Make a ranged spell attack against that creature. On a hit, the target takes 1d12 lightning damage, and on each of your turns for the duration, you can use your action to deal 1d12 lightning damage to the target automatically. The spell ends if you use your action to do anything else. The spell also ends if the target is ever outside the spell’s range or if it has total cover from you.

  At Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the initial damage increases by 1d12 for each slot level above 1st.",
  school: 'evocation',
  range: '30 feet',
  components: ['V','S',"M (a twig from a tree that has been struck by lightning)"],
  duration: 'Concentration, up to 1 minute',
  attack: 'true',
  atk_dmg: {
    1=> '1d12',
  },
  dmg_type: 'Lightning',
  id: 356,
)

Spell.create(
  name: "Word of Recall",
  level: 6,
  description: "You and up to five willing creatures within 5 feet of you instantly teleport to a previously designated sanctuary. You and any creatures that teleport with you appear in the nearest unoccupied space to the spot you designated when you prepared your sanctuary (see below). If you cast this spell without first preparing a sanctuary, the spell has no effect.

  You must designate a sanctuary by casting this spell within a location, such as a temple, dedicated to or strongly linked to your deity. If you attempt to cast the spell in this manner in an area that isn't dedicated to your deity, the spell has no effect.",
  school: 'conjuration',
  range: '5 feet',
  components: ['V'],
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 357,
)

Spell.create(
  name: "Wrathful Smite",
  level: 1,
  description: "The next time you hit with a melee weapon attack during this spell’s duration, your attack deals an extra 1d6 psychic damage. Additionally, if the target is a creature, it must make a Wisdom saving throw or be frightened of you until the spell ends. As an action, the creature can make a Wisdom check against your spell save DC to steel its resolve and end this spell.",
  school: 'evocation',
  components: ['V'],
  duration: 'Concentration, up to 1 minute',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 358,
)

Spell.create(
  name: "Zone of Truth",
  level: 2,
  description: "You create a magical zone that guards against deception in a 15-foot-radius sphere centered on a point of your choice within range. Until the spell ends, a creature that enters the spell's area for the first time on a turn or starts its turn there must make a Charisma saving throw. On a failed save, a creature can't speak a deliberate lie while in the radius. You know whether each creature succeeds or fails on its saving throw.

  An affected creature is aware of the spell and can thus avoid answering questions to which it would normally respond with a lie. Such creatures can be evasive in its answers as long as it remains within the boundaries of the truth.",
  school: 'enchantment',
  range: '60 feet',
  duration: '10 minutes',
  attack: 'false',
  atk_dmg: {},
  dmg_type: '',
  id: 359,
)

=begin
Spell.create(
  name: "",
  level: ,
  description: "",
  school: '',
  range: '',
  components: ['V','S',"M ()"],
  duration: '',
  attack: '',
  atk_dmg: {
    1=> '',
  },
  dmg_type: '',
  id:
)
=end

bard = [5,6,9,23,24,30,33,37,43,45,50,52,59,60,62,83,85,86,94,96,97,98,101,102,106,107,109,114,118,119,122,124,126,127,128,129,132,146,147,148,149,152,155,157,161,162,164,170,174,175,178,180,185,187,188,193,195,196,198,199,201,204,205,206,207,209,213,215,216,219,223,224,226,227,228,230,232,235,237,239,243,246,250,252,254,255,256,257,259,263,264,269,274,278,285,287,288,289,292,297,298,300,304,305,306,312,316,320,321,324,325,330,332,335,337,338,340,342,359]
cleric = [2,8,11,18,19,24,26,28,30,32,34,37,43,50,55,56,65,72,75,76,79,80,81,85,89,93,94,95,100,101,103,104,111,114,119,129,132,133,138,140,145,148,151,152,153,157,162,163,165,166,169,171,173,174,177,181,182,191,192,196,199,201,205,206,210,216,217,218,221,223,249,250,251,258,265,266,267,268,269,274,276,277,278,280,282,283,285,289,294,297,303,305,309,310,313,320,327,332,336,337,348,350,357,359]
druid = [5,6,7,10,12,23,27,29,35,42,45,57,62,63,66,67,68,70,72,75,76,80,85,88,94,95,101.105,109,110,111,114,117,124,128,129,132,133,138,139,141,144,147,148,152,154,158,159,162,165,167,170,173,174,175,177,181,186,192,194,199,204,205,206,207,216,221,223,228,233,238,244,250,251,252,253,254,262,265,267,268,274,275,277,279,285,291,295,301.304,306,308,313,314,315,317,318,328,330,333,334,336,339,343,346,347,349,350,353,354]
paladin = [2,20,21,22,25,26,34,36,40,49,55,58,79,84,85,89,92,93,94,95,100,101,113,131,133,152,178,194,199,205,206,210,214,266,267,268,269,276,280,286,294,311,329,358,359]
ranger = [3,5,6,27,29,57,63,64,69,70,77,85,88,94,95,116,133,144,148,158,159,168,184,199,202,204,205,206,207,239,244,252,265,267,297,304,306,308,314,319,334,349,350,354]
sorceror = [1,4,9,14,26,33,35,37,38,39,41,44,45,46,47,48,50,52,53,54,59,61,62,78,82,83,86,87,88,90,94.96,97,98,99,101,105,106,107,111,114,115,119,121,122,125,126,127,134,135,136,138,143,144,149,150,151,156,161,167,172,180,181,185,186,190,192,193,194,195,200,201,203,208,209,212,215,219,223,224,225,227,229,231,238,246,251,253,254,256,257,259,260,265,272,273,279,284,288,293,296,298,300,301,302,307,312,314,316,317,318,322,324,325,330,331,332,337,338,343,346,349,350,351,355,356]
warlock = [14,16,17,18,26,33,35,45,46,48,52,59,67,71,78,81,83,87,91,97,101,106,109,112,118,119,121,122,126,128,134,142,143,146,147,149,150,155,170,176,179,180,181,183,185,188,189,193,209,210,215,219,227,229,231,251,253,256,257,259,266,271,276,285,287,292,307,316,332,335,337,338,340,341,356]
wizard = [1,3,4,8,9,11,12,13,14,15,18,26,30,31,33,35,37,38,39,41,44,45,46,47,48,50,51,52,53,54,59,61,62,66,68,71,73,75,76,78,81,82,83,86,87,88,90,91,94,96,97,98,99,101,106,107,108,109,115,119,120,121,122,123,125,126,127,128,129,130,134,135,136,137,141,142,143,144,146,147,149,150,151,152,153,156,157,160,161,164,167,170,172,180,181,185,186,187,188,189,190,193,194,195,196,197,198,200,201,203,205,206,207,208,209,210,211,212,213,214,215,219,220,222,223,224,225,226,227,228,229,230,231,232,234,235,236,237,238,239,240,241,242,243,245,246,247,248,250,251,253,254,256,257,259,260,261,263,264,265,266,270,271,272,273,276,279,281,284,285,287,288,289,290,291,292,293,296,298,299,300,301,302,307,312,313,314,316,317,318,320,321,322,323,324,325,326,330,331,332,335,337,338,340,341,343,344,345,346,349,351,352,355,356]

Bard_list = ClassSpellList.create( name: 'Bard' )
Cleric_list = ClassSpellList.create( name: 'Cleric' )
Druid_list = ClassSpellList.create( name: 'Druid' )
Paladin_list = ClassSpellList.create( name: 'Paladin' )
Ranger_list = ClassSpellList.create( name: 'Ranger' )
Sorceror_list = ClassSpellList.create( name: 'Sorceror' )
Warlock_list = ClassSpellList.create( name: 'Warlock' )
Wizard_list = ClassSpellList.create( name: 'Wizard' )

bard.each do |index|
  ClassSpellListsSpells.create(
    class_spell_list_id: Bard_list.id,
    spell_id: index
  )
end

cleric.each do |index|
  ClassSpellListsSpells.create(
    class_spell_list_id: Cleric_list.id,
    spell_id: index
  )
end

druid.each do |index|
  ClassSpellListsSpells.create(
    class_spell_list_id: Druid_list.id,
    spell_id: index
  )
end

paladin.each do |index|
  ClassSpellListsSpells.create(
    class_spell_list_id: Paladin_list.id,
    spell_id: index
  )
end

ranger.each do |index|
  ClassSpellListsSpells.create(
    class_spell_list_id: Ranger_list.id,
    spell_id: index
  )
end

sorceror.each do |index|
  ClassSpellListsSpells.create(
    class_spell_list_id: Sorceror_list.id,
    spell_id: index
  )
end

warlock.each do |index|
  ClassSpellListsSpells.create(
    class_spell_list_id: Warlock_list.id,
    spell_id: index
  )
end

wizard.each do |index|
  ClassSpellListsSpells.create(
    class_spell_list_id: Wizard_list.id,
    spell_id: index
  )
end

Armor.create(
  stealth_disadvantage: 1,
  weight: 8,
  cost_gp: 5,
  name: 'Padded Armor',
)

Armor.create(
  weight: 10,
  cost_gp: 10,
  name: 'Leather',
)

Armor.create(
  ac_base: 12,
  weight: 13,
  cost_gp: 45,
  name: 'Studded Leather',
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 12,
  weight: 12,
  cost_gp: 10,
  name: 'Hide Armor',
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 13,
  weight: 20,
  cost_gp: 50,
  name: 'Chain Shirt',
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 14,
  stealth_disadvantage: 1,
  weight: 45,
  cost_gp: 50,
  name: 'Scale Mail',
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 14,
  weight: 20,
  cost_gp: 400,
  name: 'Breastplate',
)

Armor.create(
  arm_type: 'Medium',
  ac_base: 15,
  stealth_disadvantage: 1,
  weight: 40,
  cost_gp: 750,
  name: 'Half Plate',
)

Armor.create(
  arm_type: 'Heavy',
  ac_base: 14,
  stealth_disadvantage: 1,
  weight: 40,
  cost_gp: 30,
  name: 'Ring Mail',
)

Armor.create(
  arm_type: 'Heavy',
  ac_base: 16,
  stealth_disadvantage: 1,
  weight: 55,
  cost_gp: 75,
  str_req: 13,
  name: 'Chain Mail',
)

Armor.create(
  arm_type: 'Heavy',
  ac_base: 17,
  stealth_disadvantage: 1,
  weight: 60,
  cost_gp: 200,
  str_req: 15,
  name: 'Splint Armor',
)

Armor.create(
  arm_type: 'Heavy',
  ac_base: 18,
  stealth_disadvantage: 1,
  weight: 65,
  cost_gp: 1500,
  str_req: 15,
  name: 'Full Plate Steel',
)

Armor.create(
  arm_type: 'Shield',
  ac_base: 2,
  weight: 6,
  cost_gp: 10,
  name: 'Round Shield',
)

Armor.create(
  arm_type: 'Shield',
  ac_base: 2,
  weight: 6,
  cost_gp: 10,
  name: 'Wooden Shield',
)

Weapon.create(
  properties: ['Light'],
  weight: 2,
  cost_gp: 1,
  name: 'Club',
)

Weapon.create(
  dmg_type: 'piercing',
  properties: ['Finesse','Light','Thrown: 20/60'],
  weight: 1,
  cost_gp: 2,
  name: 'Dagger',
)

Weapon.create(
  hit_die: '1d8',
  properties: ['Two-handed'],
  weight: 10,
  cost_gp: 20,
  name: 'Greatclub',
)

Weapon.create(
  hit_die: '1d6',
  dmg_type: 'slashing',
  properties: ['Light','Thrown: 20/60'],
  weight: 2,
  cost_gp: 500,
  name: 'Handaxe',
)

Weapon.create(
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Thrown: 30/120'],
  weight: 2,
  cost_gp: 50,
  name: 'Javelin',
)

Weapon.create(
  properties: ['Light','Thrown: 20/60'],
  weight: 2,
  cost_gp: 200,
  name: 'Light Hammer',
)

Weapon.create(
  hit_die: '1d6',
  weight: 4,
  cost_gp: 500,
  name: 'Mace',
)

Weapon.create(
  hit_die: '1d6',
  properties: ['Versatile: 1d8'],
  weight: 4,
  cost_gp: 20,
  name: 'Quarterstaff',
)

Weapon.create(
  dmg_type: 'slashing',
  properties: ['Light'],
  weight: 2,
  cost_gp: 100,
  name: 'Sickle',
)

Weapon.create(
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Thrown: 20/60','Versatile: 1d8'],
  weight: 3,
  cost_gp: 100,
  name: 'Spear',
)

Weapon.create(
  ranged: 1,
  hit_die: '1d8',
  dmg_type: 'piercing',
  properties: ['Ammunition: 80/320','Loading','Two-handed'],
  weight: 5,
  cost_gp: 2500,
  name: 'Light Crossbow',
)

Weapon.create(
  ranged: 1,
  dmg_type: 'piercing',
  properties: ['Finesse','Thrown: 20/60'],
  weight: 1,
  cost_gp: 5,
  name: 'Dart',
)

Weapon.create(
  ranged: 1,
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Ammunition: 80/320','Two-handed'],
  weight: 2,
  cost_gp: 2500,
  name: 'Shortbow',
)

Weapon.create(
  ranged: 1,
  properties: ['Ammunition: 30/120'],
  weight: 0,
  cost_gp: 10,
  name: 'Sling',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'slashing',
  properties: ['Versatile: 1d10'],
  weight: 4,
  cost_gp: 1000,
  name: 'Battleaxe',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  weight: 2,
  cost_gp: 1000,
  name: 'Flail',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d10',
  dmg_type: 'slashing',
  properties: ['Heavy','Reach','Two-handed'],
  weight: 6,
  cost_gp: 2000,
  name: 'Glaive',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d12',
  dmg_type: 'slashing',
  properties: ['Heavy','Two-handed'],
  weight: 7,
  cost_gp: 3000,
  name: 'Greataxe',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '2d6',
  dmg_type: 'slashing',
  properties: ['Heavy','Two-handed'],
  weight: 6,
  cost_gp: 5000,
  name: 'Greatsword',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d10',
  dmg_type: 'slashing',
  properties: ['Heavy','Reach','Two-handed'],
  weight: 6,
  cost_gp: 2000,
  name: 'Halberd',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d12',
  dmg_type: 'piercing',
  properties: ['Reach','Special'],
  weight: 6,
  cost_gp: 1000,
  name: 'Lance',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'slashing',
  properties: ['Versatile: 1d10'],
  weight: 3,
  cost_gp: 1500,
  name: 'Longsword',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '2d6',
  properties: ['Heavy','Two-handed'],
  weight: 10,
  cost_gp: 1000,
  name: 'Maul',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'piercing',
  weight: 4,
  cost_gp: 1500,
  name: 'Morningstar',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d10',
  dmg_type: 'piercing',
  properties: ['Heavy','Reach','Two-handed'],
  weight: 18,
  cost_gp: 500,
  name: 'Pike',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'piercing',
  properties: ['Finesse'],
  weight: 2,
  cost_gp: 2500,
  name: 'Rapier',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d6',
  dmg_type: 'slashing',
  properties: ['Finesse','Light'],
  weight: 3,
  cost_gp: 2500,
  name: 'Scimitar',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Finesse','Light'],
  weight: 2,
  cost_gp: 1000,
  name: 'Shortsword',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Thrown: 20/60','Versatile: 1d8'],
  weight: 4,
  cost_gp: 500,
  name: 'Trident',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  dmg_type: 'piercing',
  weight: 2,
  cost_gp: 500,
  name: 'War pick',
)

Weapon.create(
  wep_type: 'martial',
  hit_die: '1d8',
  properties: ['Versatile: 1d10'],
  weight: 2,
  cost_gp: 1500,
  name: 'Warhammer',
)

Weapon.create(
  wep_type: 'martial',
  dmg_type: 'slashing',
  properties: ['Finesse','Reach'],
  weight: 3,
  cost_gp: 200,
  name: 'Whip',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '1',
  dmg_type: 'piercing',
  properties: ['Ammunition: 25/100','Loading'],
  weight: 1,
  cost_gp: 1000,
  name: 'Blowgun',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '1d6',
  dmg_type: 'piercing',
  properties: ['Ammunition: 30/120','Light','Loading'],
  weight: 3,
  cost_gp: 7500,
  name: 'Hand Crossbow',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '1d10',
  dmg_type: 'piercing',
  properties: ['Ammunition: 100/400','Heavy','Loading','Two-handed'],
  weight: 18,
  cost_gp: 5000,
  name: 'Heavy Crossbow',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '1d8',
  dmg_type: 'piercing',
  properties: ['Ammunition: 150/600','Heavy','Two-handed'],
  weight: 2,
  cost_gp: 5000,
  name: 'Longbow',
)

Weapon.create(
  wep_type: 'martial',
  ranged: 1,
  hit_die: '',
  dmg_type: '',
  properties: ['Special','Thrown: 5/15'],
  weight: 3,
  cost_gp: 100,
  name: 'Net',
)

Equipment.create(
  name: 'Abacus',
  weight: 2,
  cost_gp: 200,
)

Equipment.create(
  name: 'Acid (vial)',
  weight: 1,
  cost_gp: 2500,
)

Equipment.create(
  name: "Alchemist's Fire (flask)",
  weight: 1,
  cost_gp: 5000,
)

Equipment.create(
  name: "Arrows",
  count: 20,
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Blowgun Needles",
  count: 50,
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Bolts",
  count: 20,
  weight: 2,
  cost_gp: 100,
)

Equipment.create(
  name: "Sling Bullets",
  count: 20,
  weight: 2,
  cost_gp: 4,
)

Equipment.create(
  name: "Antitoxin (vial)",
  cost_gp: 5000,
)

Equipment.create(
  name: "Arcane Crystal",
  weight: 1,
  cost_gp: 1000,
)

Equipment.create(
  name: "Arcane Orb",
  weight: 3,
  cost_gp: 2000,
)

Equipment.create(
  name: "Arcane Rod",
  weight: 4,
  cost_gp: 500,
)

Equipment.create(
  name: "Arcane Wand",
  weight: 1,
  cost_gp: 1000,
)

Backpack = Equipment.create(
  name: "Backpack",
  weight: 5,
  cost_gp: 200,
)

BallBearings = Equipment.create(
  name: "Ball bearings",
  count: 1000,
  weight: 2,
  cost_gp: 100,
)

Equipment.create(
  name: "Barrel",
  weight: 70,
  cost_gp: 200,
)

Equipment.create(
  name: "Basket",
  weight: 2,
  cost_gp: 40,
)

Equipment.create(
  name: "Bedroll",
  weight: 7,
  cost_gp: 100,
)

Bell = Equipment.create(
  name: "Bell",
  cost_gp: 100,
)

Equipment.create(
  name: "Blanket",
  weight: 3,
  cost_gp: 50,
)

Equipment.create(
  name: "Block and Tackle",
  weight: 5,
  cost_gp: 100,
)

Equipment.create(
  name: "Book",
  weight: 5,
  cost_gp: 2500,
)

Equipment.create(
  name: "Bottle",
  weight: 2,
  cost_gp: 200,
)

Equipment.create(
  name: "Bucket",
  weight: 2,
  cost_gp: 5,
)

Equipment.create(
  name: "Caltrops",
  count: 20,
  weight: 2,
  cost_gp: 100,
)

Candle = Equipment.create(
  name: "Candle",
  cost_gp: 1,
)

Equipment.create(
  name: "Case, crossbow bolts",
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Case, map or scroll",
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Chain, 10ft",
  weight: 10,
  cost_gp: 500,
)

Equipment.create(
  name: "Chalk, 1 piece",
  cost_gp: 1,
)

Equipment.create(
  name: "Chest",
  weight: 25,
  cost_gp: 500,
)

Equipment.create(
  name: "Climber's Kit",
  weight: 12,
  cost_gp: 2500,
)

Equipment.create(
  name: "Clothes, common",
  weight: 3,
  cost_gp: 50,
)

Equipment.create(
  name: "Clothes, costume",
  weight: 4,
  cost_gp: 500,
)

Equipment.create(
  name: "Clothes, fine",
  weight: 6,
  cost_gp: 1500,
)

Equipment.create(
  name: "Clothes, sacred vestments",
  weight: 8,
  cost_gp: 2000,
)

Equipment.create(
  name: "Clothes, traveler's",
  weight: 4,
  cost_gp: 200,
)

Equipment.create(
  name: "Component Pouch",
  weight: 2,
  cost_gp: 250,
)

Crowbar = Equipment.create(
  name: "Crowbar",
  weight: 5,
  cost_gp: 200,
)

Equipment.create(
  name: "Sprig of Mistletoe",
  cost_gp: 100,
)

Equipment.create(
  name: "Totem",
  cost_gp: 100,
)

Equipment.create(
  name: "Wooden Staff",
  weight: 4,
  cost_gp: 500,
)

Equipment.create(
  name: "Yew Wand",
  weight: 1,
  cost_gp: 1000,
)

Equipment.create(
  name: "Fishing Tackle",
  weight: 4,
  cost_gp: 100,
)
Equipment.create(
  name: "Flask",
  weight: 1,
  cost_gp: 2,
)

Equipment.create(
  name: "Grappling Hook",
  weight: 4,
  cost_gp: 200,
)

Hammer = Equipment.create(
  name: "Hammer",
  weight: 3,
  cost_gp: 100,
)

Equipment.create(
  name: "Hammer, sledge",
  weight: 10,
  cost_gp: 200,
)

Equipment.create(
  name: "Healer's Kit",
  weight: 3,
  cost_gp: 500,
)

Equipment.create(
  name: "Holy Amulet",
  weight: 1,
  cost_gp: 500,
)

Equipment.create(
  name: "Holy Emblem",
  cost_gp: 500,
)

Equipment.create(
  name: "Holy Reliquary",
  weight: 2,
  cost_gp: 500,
)

Equipment.create(
  name: "Holy Water (flask)",
  weight: 1,
  cost_gp: 2500,
)

Equipment.create(
  name: "Prayer Book",
  weight: 1,
  cost_gp: 50
)

Equipment.create(
  name: "Hourglass",
  weight: 1,
  cost_gp: 2500,
)

Equipment.create(
  name: "Hunting Trap",
  weight: 25,
  cost_gp: 500,
)

Equipment.create(
  name: "Incense",
  cost_gp: 20,
)

Equipment.create(
  name: "Ink, 1 ounce bottle",
  cost_gp: 1000,
)

Equipment.create(
  name: "Ink Pen",
  cost_gp: 2,
)

Equipment.create(
  name: "Jug or pitcher",
  weight: 4,
  cost_gp: 2,
)

Equipment.create(
  name: "Ladder (10 foot)",
  weight: 25,
  cost_gp: 10,
)

Lamp = Equipment.create(
  name: "Lamp",
  weight: 1,
  cost_gp: 50,
)

BullseyeLantern = Equipment.create(
  name: "Bullseye Lantern",
  weight: 2,
  cost_gp: 1000,
)

HoodedLantern = Equipment.create(
  name: "Hooded Lantern",
  weight: 2,
  cost_gp: 500,
)

Equipment.create(
  name: "Lock",
  weight: 1,
  cost_gp: 1000,
)

Equipment.create(
  name: "Magnifying Glass",
  cost_gp: 10000,
)

Equipment.create(
  name: "Manacles",
  weight: 6,
  cost_gp: 200,
)

Equipment.create(
  name: "Mess Kit",
  weight: 1,
  cost_gp: 20,
)

Equipment.create(
  name: "Mirror, steel",
  weight: 1,
  cost_gp: 500,
)

OilFlask = Equipment.create(
  name: "Oil (flask)",
  weight: 1,
  cost_gp: 10,
)

Equipment.create(
  name: "Paper (one sheet)",
  cost_gp: 20,
)

Equipment.create(
  name: "Parchment (one sheet)",
  cost_gp: 10,
)

Equipment.create(
  name: "Perfume (vial)",
  cost_gp: 500,
)

Equipment.create(
  name: "Miner's Pick",
  weight: 10,
  cost_gp: 200,
)

Piton = Equipment.create(
  name: "Piton",
  cost_gp: 5,
)

Equipment.create(
  name: "Poison, basic (vial)",
  cost_gp: 10000,
)

Equipment.create(
  name: "Pole, 10 foot",
  weight: 7,
  cost_gp: 5,
)

Equipment.create(
  name: "Pot, iron",
  weight: 10,
  cost_gp: 200,
)

Equipment.create(
  name: "Potion of Healing",
  weight: 1,
  cost_gp: 5000,
)

Equipment.create(
  name: "Pouch",
  weight: 1,
  cost_gp: 50,
)

Equipment.create(
  name: "Quiver",
  weight: 1,
  cost_gp: 100,
)

Equipment.create(
  name: "Ram, portable",
  weight: 35,
  cost_gp: 400,
)

Rations = Equipment.create(
  name: "Rations (1 day)",
  weight: 2,
  cost_gp: 50,
)

Equipment.create(
  name: "Robes",
  weight: 4,
  cost_gp: 100,
)

HempRope = Equipment.create(
  name: "Rope, hempen (50 feet)",
  weight: 10,
  cost_gp: 100,
)

SilkRope = Equipment.create(
  name: "Rope, silk (50 feet)",
  weight: 5,
  cost_gp: 1000,
)

Equipment.create(
  name: "Sack",
  weight: 1,
  cost_gp: 1,
)

Equipment.create(
  name: "Scale, merchant's",
  weight: 3,
  cost_gp: 500,
)

Equipment.create(
  name: "Sealing Wax",
  cost_gp: 50,
)

Equipment.create(
  name: "Shovel",
  weight: 5,
  cost_gp: 200,
)

Equipment.create(
  name: "Signal Whistle",
  cost_gp: 5,
)

Equipment.create(
  name: "Signet Ring",
  cost_gp: 500,
)

Equipment.create(
  name: "Soap",
  cost_gp: 2,
)

Equipment.create(
  name: "Spellbook",
  weight: 3,
  cost_gp: 5000,
)

Equipment.create(
  name: "Spikes, iron",
  count: 10,
  weight: 5,
  cost_gp: 100,
)

Equipment.create(
  name: "Spyglass",
  weight: 1,
  cost_gp: 100000,
)

String10ft = Equipment.create(
  name: "String, 10 feet",
  cost_gp: 20,
)

Equipment.create(
  name: "Tent, two-person",
  weight: 20,
  cost_gp: 200,
)

Tinderbox = Equipment.create(
  name: "Tinderbox",
  weight: 1,
  cost_gp: 50,
)

Equipment.create(
  name: "Torch",
  weight: 1,
  cost_gp: 1,
)

Equipment.create(
  name: "Vial",
  cost_gp: 100,
)

Waterskin = Equipment.create(
  name: "Waterskin",
  weight: 1,
  cost_gp: 1,
)

Equipment.create(
  name: "Whetstone",
  weight: 1,
  cost_gp: 1,
)

Tool.create(
  name: "Alchemist's Supplies",
  cost_cp: 5000,
  weight: 8,
)
Tool.create(
  name: "Brewer's Supplies",
  cost_cp: 2000,
  weight: 9,
)
Tool.create(
  name: "Calligrapher's Supplies",
  cost_cp: 1000,
  weight: 5,
)
Tool.create(
  name: "Carpenter's Tools",
  cost_cp: 800,
  weight: 6,
)
Tool.create(
  name: "Cartographer's Tools",
  cost_cp: 1500,
  weight: 6,
)
Tool.create(
  name: "Cobbler's Tools",
  cost_cp: 500,
  weight: 5,
)
Tool.create(
  name: "Cook's Utensils",
  cost_cp: 100,
  weight: 8,
)
Tool.create(
  name: "Glassblower's Tools",
  cost_cp: 3000,
  weight: 5,
)
Tool.create(
  name: "Jeweler's Tools",
  cost_cp: 2500,
  weight: 2,
)
Tool.create(
  name: "Leatherworker's Tools",
  cost_cp: 500,
  weight: 5,
)
Tool.create(
  name: "Mason's Tools",
  cost_cp: 1000,
  weight: 8,
)
Tool.create(
  name: "Painter's Supplies",
  cost_cp: 1000,
  weight: 5,
)
Tool.create(
  name: "Potter's Tools",
  cost_cp: 1000,
  weight: 3,
)
Tool.create(
  name: "Smith's Tools",
  cost_cp: 2000,
  weight: 8,
)
Tool.create(
  name: "Tinker's Tools",
  cost_cp: 5000,
  weight: 10,
)
Tool.create(
  name: "Weaver's Tools",
  cost_cp: 100,
  weight: 5,
)
Tool.create(
  name: "Woodcarver's Tools",
  cost_cp: 100,
  weight: 5,
)

Tool.create(
  name: "Thief's Tools",
  cost_cp: 500,
  weight: 2,
)

Tool.create(
  name: "Disguise Kit",
  tool_type: 'generic',
  cost_cp: 2500,
  weight: 3,
)
Tool.create(
  name: "Forgery Kit",
  tool_type: 'generic',
  cost_cp: 1500,
  weight: 5,
)
Tool.create(
  name: "Herbalism Kit",
  tool_type: 'generic',
  cost_cp: 500,
  weight: 3,
)
Tool.create(
  name: "Navigator's Tools",
  tool_type: 'generic',
  cost_cp: 2500,
  weight: 2,
)
Tool.create(
  name: "Poisoner's Kit",
  tool_type: 'generic',
  cost_cp: 5000,
  weight: 2,
)
Tool.create(
  name: "Thieves' Tools",
  tool_type: 'generic',
  cost_cp: 2500,
  weight: 1,
)
Tool.create(
  name: "Dice Set",
  tool_type: 'gaming',
  cost_cp: 10,
)
Tool.create(
  name: "Dragonchess Set",
  tool_type: 'gaming',
  cost_cp: 100,
  weight: 1,
)
Tool.create(
  name: "Playing Cards",
  tool_type: 'gaming',
  cost_cp: 50,
)
Tool.create(
  name: "Three-Dragon Ante Set",
  tool_type: 'gaming',
  cost_cp: 100,
)

Tool.create(
  name: "Bagpipes",
  tool_type: 'instrument',
  cost_cp: 3000,
  weight: 6,
)
Tool.create(
  name: "Drum",
  tool_type: 'instrument',
  cost_cp: 600,
  weight: 3,
)
Tool.create(
  name: "Dulcimer",
  tool_type: 'instrument',
  cost_cp: 2500,
  weight: 10,
)
Tool.create(
  name: "Flute",
  tool_type: 'instrument',
  cost_cp: 200,
  weight: 1,
)
Tool.create(
  name: "Lute",
  tool_type: 'instrument',
  cost_cp: 3500,
  weight: 2,
)
Tool.create(
  name: "Lyre",
  tool_type: 'instrument',
  cost_cp: 3000,
  weight: 2,
)
Tool.create(
  name: "Horn",
  tool_type: 'instrument',
  cost_cp: 300,
  weight: 2,
)
Tool.create(
  name: "Pan Flute",
  tool_type: 'instrument',
  cost_cp: 1200,
  weight: 2,
)
Tool.create(
  name: "Shawm",
  tool_type: 'instrument',
  cost_cp: 200,
  weight: 1,
)
Tool.create(
  name: "Viol",
  tool_type: 'instrument',
  cost_cp: 3000,
  weight: 1,
)
Gearpack.create(
  name: "Burglar's Pack",
  cost_cp: 1600,
  id: 1,
)
Gearpack.create(
  name: "Diplomat's Pack",
  cost_cp: 3900,
  id: 2,
)
Gearpack.create(
  name: "Dungeoneer's Pack",
  cost_cp: 1200,
  id: 3,
)
Gearpack.create(
  name: "Entertainer's Pack",
  cost_cp: 4000,
  id: 4,
)
Gearpack.create(
  name: "Explorer's Pack",
  cost_cp: 1000,
  id: 5,
)
Gearpack.create(
  name: "Priest's Pack",
  cost_cp: 1900,
  id: 6,
)
Gearpack.create(
  name: "Scholar's Pack",
  cost_cp: 4000,
  id: 7,
)
#Burglar's Pack
EquipmentGearpack.create(
  equipment_id: Backpack.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: BallBearings.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: String10ft.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Bell.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Candle.id,
  gearpack_id: 1,
  count: 5,
)
EquipmentGearpack.create(
  equipment_id: Crowbar.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Hammer.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Piton.id,
  gearpack_id: 1,
  count: 10,
)
EquipmentGearpack.create(
  equipment_id: HoodedLantern.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: OilFlask.id,
  gearpack_id: 1,
  count: 2,
)
EquipmentGearpack.create(
  equipment_id: Rations.id,
  gearpack_id: 1,
  count: 5,
)
EquipmentGearpack.create(
  equipment_id: Tinderbox.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: Waterskin.id,
  gearpack_id: 1,
)
EquipmentGearpack.create(
  equipment_id: HempRope.id,
  gearpack_id: 1,
)