class Subclass < ApplicationRecord
  serialize :custom, Hash
  serialize :features, Hash
  serialize :extra_spells, Hash
  serialize :specific_spells, Hash
  serialize :custom_mods, Hash
  serialize :equipment_choices, Hash

  belongs_to :player_class
  has_many :characters

  def to_param
    name
  end
end
