# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_18_194224) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armors", force: :cascade do |t|
    t.string "arm_type", default: "Light"
    t.integer "ac_base", default: 11
    t.integer "str_req", default: 0
    t.integer "stealth_disadvantage", default: 0
    t.integer "weight", default: 0
    t.integer "cost_gp", default: 0
    t.string "name", default: ""
    t.string "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "backgrounds", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "skills", default: [], array: true
    t.string "weapons", default: [], array: true
    t.string "armor", default: [], array: true
    t.string "tools", default: [], array: true
    t.integer "extra_languages", default: 0
    t.text "equipment_choices", default: "{}"
    t.string "features", default: [], array: true
    t.string "traits", default: [], array: true
    t.string "ideals", default: [], array: true
    t.string "bonds", default: [], array: true
    t.string "flaws", default: [], array: true
    t.string "specialties", default: [], array: true
    t.string "specialty_description"
    t.integer "gold"
    t.text "extra_spells", default: "{}"
    t.text "specific_spells", default: "{}"
    t.text "custom_mods", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.integer "race_id"
    t.integer "subrace_id"
    t.integer "player_class_id"
    t.integer "background_id"
    t.integer "feat_id"
    t.integer "user_id"
    t.string "player_name"
    t.string "char_name"
    t.string "age"
    t.string "height"
    t.string "eyes"
    t.string "hair"
    t.string "skin"
    t.string "gender"
    t.string "description"
    t.string "languages", default: [], array: true
    t.string "weapon_prof", default: [], array: true
    t.string "armor_prof", default: [], array: true
    t.string "tool_prof", default: [], array: true
    t.string "skill_prof", default: [], array: true
    t.string "expertise", default: [], array: true
    t.string "size"
    t.integer "speed"
    t.integer "hp_max"
    t.string "equipment", default: [], array: true
    t.integer "gold"
    t.integer "silver"
    t.integer "copper"
    t.string "spells", default: [], array: true
    t.integer "spell_slots", default: [], array: true
    t.string "trait"
    t.string "ideal"
    t.string "bond"
    t.string "flaw"
    t.string "bkgd_specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_spell_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_spell_lists_spells", id: false, force: :cascade do |t|
    t.integer "class_spell_list_id"
    t.integer "spell_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name", default: ""
    t.string "description", default: ""
    t.integer "count", default: 1
    t.integer "weight", default: 0
    t.integer "cost_gp", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment_gearpacks", id: false, force: :cascade do |t|
    t.integer "equipment_id"
    t.integer "gearpack_id"
    t.integer "count", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feats", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "features", default: [], array: true
    t.string "extra_languages", default: "0"
    t.text "extra_spells", default: "{}"
    t.text "specific_spells", default: "{}"
    t.text "custom_mods", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gearpacks", force: :cascade do |t|
    t.string "name"
    t.integer "cost_cp", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gearpacks_tools", id: false, force: :cascade do |t|
    t.integer "gearpack_id"
    t.integer "tool_id"
    t.integer "count", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_classes", force: :cascade do |t|
    t.string "name"
    t.integer "hit_die"
    t.integer "starting_hp"
    t.integer "saving_throws", default: [], array: true
    t.string "armor", default: [], array: true
    t.string "weapons", default: [], array: true
    t.string "tools", default: [], array: true
    t.string "skill_choices", default: [], array: true
    t.integer "num_skills", default: 0
    t.text "equipment_choices", default: "{}"
    t.integer "spellcasting_ability", default: 0
    t.integer "spell_table", default: [], array: true
    t.text "extra_spells", default: "{}"
    t.text "specific_spells", default: "{}"
    t.integer "wealth_die", default: 2
    t.integer "wealth_mult", default: 10
    t.text "features", default: "{}"
    t.text "leveled_choice", default: "{}"
    t.text "custom_mods", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.integer "asi", default: [0, 0, 0, 0, 0, 0], array: true
    t.integer "age_limit", default: 500
    t.string "heightlow", default: "4'6\""
    t.string "heighthigh", default: "7\"6"
    t.string "languages", default: [], array: true
    t.integer "extra_languages", default: 0
    t.integer "extra_skills", default: 0
    t.integer "extra_asi", default: 0
    t.string "weapons", default: [], array: true
    t.string "armor", default: [], array: true
    t.string "tools", default: [], array: true
    t.string "skills", default: [], array: true
    t.string "tool_choice", default: [], array: true
    t.string "size", default: "medium"
    t.integer "speed", default: 15
    t.string "features", default: [], array: true
    t.text "extra_spells", default: "{}"
    t.text "specific_spells", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.integer "level", default: 0
    t.text "description"
    t.string "school"
    t.integer "ritual", default: 0
    t.string "cast_time", default: "1 action"
    t.string "range", default: "Self"
    t.string "components", default: ["V", "S", ""], array: true
    t.string "duration", default: "Instantaneous"
    t.string "attack", default: "false"
    t.text "atk_dmg", default: "{}"
    t.string "dmg_type", default: "none"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subclasses", force: :cascade do |t|
    t.integer "player_class_id"
    t.string "name"
    t.text "features", default: "{}"
    t.text "leveled_choice", default: "{}"
    t.text "extra_spells", default: "{}"
    t.text "custom_mods", default: "{}"
    t.text "specific_spells", default: "{}"
    t.text "equipment_choices", default: "{}"
    t.string "weapons", default: [], array: true
    t.string "armor", default: [], array: true
    t.string "tools", default: [], array: true
    t.string "languages", default: [], array: true
    t.integer "extra_languages", default: 0
    t.string "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subraces", force: :cascade do |t|
    t.integer "race_id"
    t.string "name"
    t.integer "asi", default: [], array: true
    t.string "languages", default: [], array: true
    t.integer "extra_languages", default: 0
    t.string "weapons", default: [], array: true
    t.string "armor", default: [], array: true
    t.string "tools", default: [], array: true
    t.string "features", default: [], array: true
    t.text "extra_spells", default: "{}"
    t.text "specific_spells", default: "{}"
    t.text "custom_mods", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.string "tool_type", default: "artisan"
    t.integer "cost_cp", default: 0
    t.integer "weight", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "wep_type", default: "simple"
    t.integer "ranged", default: 0
    t.string "hit_die", default: "1d4"
    t.string "dmg_type", default: "bludgeoning"
    t.string "properties", default: [], array: true
    t.integer "weight", default: 0
    t.integer "cost_gp", default: 0
    t.string "name", default: ""
    t.string "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
