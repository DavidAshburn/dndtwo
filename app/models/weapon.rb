class Weapon < ApplicationRecord
  def to_param
    wep_type
  end
end
