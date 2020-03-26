klasses = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/classes/").body) 
klasses['results'].each { |klass|
    Klass.new(name: klass['name']).save
}


response = RestClient.get("http://www.dnd5eapi.co/api/spells")
spells = JSON.parse(response.body)
spells["results"].length.times { |i|
    spell = JSON.parse(RestClient.get("http://www.dnd5eapi.co#{spells['results'][i]['url']}").body)
    Spell.new(name: spell['name'], level: spell['level'], desc: spell['desc']).save
 }   

 
 Klass.all.each { |klass|
    spell_list = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/classes/#{(klass.name.downcase)}/spells").body)
    if spell_list['count'] != 0
        spell_list['results'].each { |spell|
            match = Spell.all.find { |x| x.name == spell['name']}
            klass.spells.push(match)
            
        }
    end
 }


