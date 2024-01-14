class Background < ApplicationRecord
  serialize :equipment_choices, Hash
  serialize :extra_spells, Hash
  serialize :specific_spells, Hash
  serialize :custom_mods, Hash

  has_many :characters

  def to_param
    name
  end
end
