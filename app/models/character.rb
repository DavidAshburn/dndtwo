class Character < ApplicationRecord
  belongs_to :race
  belongs_to :subrace
  belongs_to :player_class
  belongs_to :subclass
  belongs_to :background
  belongs_to :user
end
