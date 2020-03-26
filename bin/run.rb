require_relative '../config/environment'



puts "Hello, this program will provide random spells for the spells-learned based classes of Dungeons and Dragons 5th Edtiion, which are Bard, Ranger, Sorcerer, Warlock, and Wizard"


while true
    puts "Choose an option: /n
        1. View existing character./n
        2. Create new character./n
        3. Exit Program"
        option = gets.chomp
    case option
    when '1'
        puts "What is your character's name?"
        name = gets.chomp
        puts "What is you character's class?"
        klass = gets.chomp
        puts "What is you character's level?"
        level = gets.chomp

        current_character = Character.all.find { |character| name == character.name && level == character.level.to_s && klass == character.klasses.first.name.downcase }
        while true
            puts "Choose an option: /n
                1. View #{current_character.name}'s spells./n
                2. Randomize #{current_character.name}'s spells./n
                3. Return to main menu."

            option = gets.chomp
            case option
            when '1'
                pp current_character.spells
            when '2'
                current_character.spells.delete_all
                current_character.randomize_spells
            when '3'
                break
            else
                puts "Please enter a number between 1 and 3."
            end
        end
    when '2'
        puts "What would you like your character's name to be?"
        name = gets.chomp
        puts "What would you like your character's class to be?"
        klass = gets.chomp
        puts "What would you like your character's level to be?"
        level = gets.chomp

        new_character = Character.new(name: name, level: level)
        new_character.choose_klass(klass)
        new_character.randomize_spells
        new_character.save

        pp new_character.spells

    when '3'
        abort "Have a nice day!"
    else
        puts "Please enter a number between 1 and 3."

    end
end




