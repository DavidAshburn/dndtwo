class Race < ApplicationRecord
  serialize :extra_spells, Hash
  serialize :specific_spells, Hash
  serialize :custom_mods, Hash

  has_many :characters
  has_many :subraces

  def to_param
    name
  end
end
