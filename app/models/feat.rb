class Feat < ApplicationRecord
  serialize :extra_spells, Hash
  serialize :specific_spells, Hash
  serialize :custom_mods, Hash
  has_many :characters
end
