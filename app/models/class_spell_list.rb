class ClassSpellList < ApplicationRecord
  has_and_belongs_to_many :spells
  serialize :atk_dmg, Hash

  def to_param
    name
  end
end
