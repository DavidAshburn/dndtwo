class Subrace < ApplicationRecord
  serialize :extra_spells, Hash
  serialize :specific_spells, Hash
  serialize :custom_mods, Hash

  belongs_to :race
  has_many :characters

  def to_param
    name
  end
end
