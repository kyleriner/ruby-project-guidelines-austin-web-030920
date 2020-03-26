require_relative '../config/environment'

def fetch_class(class_name)
    response = RestClient.get("http://www.dnd5eapi.co/api/classes/#{class_name}")
    player_class = JSON.parse(response.body)
end

def fetch_class_level(current_class)
    url = current_class["class_levels"]["url"]
    response = RestClient.get("http://www.dnd5eapi.co#{url}")
    class_levels = JSON.parse(response.body)
end

def fetch_all_spells
    response = RestClient.get("http://www.dnd5eapi.co/api/spells")
    spells = JSON.parse(response.body)
end




fetch_class('wizard')

fetch_class_level(fetch_class('wizard'))

fetch_all_spells

binding.pry

puts "HELLO WORLD"
