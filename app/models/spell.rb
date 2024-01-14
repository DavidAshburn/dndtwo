class Spell < ApplicationRecord
  serialize :atk_dmg, Hash
  has_and_belongs_to_many :class_spell_lists
end
