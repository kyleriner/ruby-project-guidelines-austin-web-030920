class Character < ActiveRecord::Base
    has_many :character_klasses
    has_many :character_spells
    has_many :klasses, through: :character_klasses
    has_many :spells, through: :character_spells


end