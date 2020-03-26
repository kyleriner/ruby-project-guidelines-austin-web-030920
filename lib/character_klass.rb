class CharacterKlass < ActiveRecord::Base

    belongs_to :character
    belongs_to :klass

    # attr_accessor :class_name, :level, :spell_list, :spells_known, :spell_list_by_level
    # def initialize(class_name, level)
    #     @class_name = class_name.downcase
    #     @level = level
    #     @spell_list = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/classes/#{class_name}/spells").body)
    #     @spell_list_by_level = []
    #     @spells_known = []
    #     10.times { |i|
    #         @spells_known[i] = {"level #{i} spells" => []}
    #     }


    def get_class_spells
        Spell.load_class_spell_list(self)
        
    end

    def randomize_spells
        case self.name
        when 'wizard'
            self.class_level.times do |i| wizard_spells_randomizer(i + 1) end
        when 'warlock'
            self.class_level.times do |i| warlock_spells_randomizer(i + 1) end
        when 'bard'
            self.class_level.times do |i| bard_spells_randomizer(i + 1) end
        when 'ranger'
            self.class_level.times do |i| ranger_spells_randomizer(i + 1) end
        when 'sorcerer'
            self.class_level.times do |i| sorcerer_spells_randomizer(i + 1) end
        else 'Error: Not a known Spellcaster'
        end
    end

    def wizard_spells_randomizer(current_level)
        case current_level
        when 1      #spell_lvl, amount
            choose_spells(0, 2)
            choose_spells(1, 6)
        when 2
            choose_spells(1, 2)
        when 3
            choose_spells(2, 2)
        when 4
            choose_spells(0, 1)
            choose_spells(2, 2)
        when 5
            choose_spells(3, 2)
        when 6
            choose_spells(3, 2)
        when 7
            choose_spells(4, 2)
        when 8
            choose_spells(4, 2)
        when 9
            choose_spells(5, 2)
        when 10
            choose_spells(5, 2)
        when 11
            choose_spells(6, 2)
        when 12
            choose_spells(6, 2)
        when 13
            choose_spells(7, 2)
        when 14
            choose_spells(7, 2)
        when 15
            choose_spells(8, 2)
        when 16
            choose_spells(8, 2)
        when 17
            choose_spells(9, 2)
        when 18
            choose_spells(9, 2)
        when 19
            choose_spells(9, 2)
        when 20
            choose_spells(9, 2)
        end
    end

    def warlock_spells_randomizer(current_level)
        case current_level
        when 1      #spell_lvl, amount
            choose_spells(0, 2)
            choose_spells(1, 2)
        when 2
            choose_spells(1, 1)
        when 3
            choose_spells(2, 1)
        when 4
            choose_spells(0, 1)
            choose_spells(2, 1)
        when 5
            choose_spells(3, 1)
        when 6
            choose_spells(3, 1)
        when 7
            choose_spells(4, 1)
        when 8
            choose_spells(4, 1)
        when 9
            choose_spells(5, 1)
        when 10
            choose_spells(0, 1)
        when 11
            choose_spells(5, 1)
        when 12
        when 13
            choose_spells(5, 1)
        when 14
        when 15
            choose_spells(5, 1)
        when 16
        when 17
            choose_spells(5, 1)
        when 18
        when 19
            choose_spells(5, 1)
        when 20
        end
        
    end

    def bard_spells_randomizer(current_level)
        case current_level
        when 1      #spell_lvl, amount
            choose_spells(0, 2)
            choose_spells(1, 4)
        when 2
            choose_spells(1, 1)
        when 3
            choose_spells(2, 1)
        when 4
            choose_spells(0, 1)
            choose_spells(2, 1)
        when 5
            choose_spells(3, 1)
        when 6
            choose_spells(3, 1)
        when 7
            choose_spells(4, 1)
        when 8
            choose_spells(4, 1)
        when 9
            choose_spells(5, 1)
        when 10
            choose_spells(0, 1)
            choose_spells(5, 2)
        when 11
            choose_spells(6, 1)
        when 12
        when 13
            choose_spells(7, 1)
        when 14
            choose_spells(7, 2)
        when 15
            choose_spells(8, 1)
        when 16
        when 17
            choose_spells(9, 2)
        when 18
            choose_spells(9, 2)
        when 19
        when 20
        end
        
    end

    def ranger_spells_randomizer(current_level)
        case current_level
        when 1      #spell_lvl, amount
        when 2
            choose_spells(1, 2)
        when 3
            choose_spells(1, 1)
        when 4
        when 5
            choose_spells(2, 1)
        when 6
        when 7
            choose_spells(2, 1)
        when 8
        when 9
            choose_spells(3, 1)
        when 10
        when 11
            choose_spells(3, 1)
        when 12
        when 13
            choose_spells(4, 1)
        when 14
        when 15
            choose_spells(4, 1)
        when 16
        when 17
            choose_spells(5, 1)
        when 18
        when 19
            choose_spells(5, 1)
        when 20
        end
        
    end

    def sorcerer_spells_randomizer(current_level)
        case current_level
        when 1      #spell_lvl, amount
            choose_spells(0, 4)
            choose_spells(1, 2)
        when 2
            choose_spells(1, 1)
        when 3
            choose_spells(2, 1)
        when 4
            choose_spells(0, 1)
            choose_spells(2, 1)
        when 5
            choose_spells(3, 1)
        when 6
            choose_spells(3, 1)
        when 7
            choose_spells(4, 1)
        when 8
            choose_spells(4, 1)
        when 9
            choose_spells(5, 1)
        when 10
            choose_spells(0, 1)
            choose_spells(5, 1)
        when 11
            choose_spells(6, 1)
        when 12
        when 13
            choose_spells(7, 1)
        when 14
        when 15
            choose_spells(8, 1)
        when 16
        when 17
            choose_spells(9, 1)
        when 18
        when 19
        when 20
        end
        
    end

    def choose_spells(spell_level, amount)
        count = 0
        while count < amount
            spell = random_spell_picker(spell_level)
            if @spells_known[spell_level]["level #{spell_level} spells"].none? do |item| item == spell end
                @spells_known[spell_level]["level #{spell_level} spells"] << spell
                count += 1
            end
        end
    end

    def random_spell_picker(spell_level)
        self.spells.select { |spell| spell.level == spell_level}.sample
    end

end