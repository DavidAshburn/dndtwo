class Gearpack < ApplicationRecord
  has_and_belongs_to_many :equipment
  has_and_belongs_to_many :tools
end
