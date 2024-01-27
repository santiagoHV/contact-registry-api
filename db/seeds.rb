Contact.destroy_all
City.destroy_all
State.destroy_all
Country.destroy_all

countries = [
  { name: 'Argentina', state_nomenclature: 'Provincia', phone_code: '+54' },
  { name: 'Bolivia', state_nomenclature: 'Departamento', phone_code: '+591' },
  { name: 'Chile', state_nomenclature: 'Región', phone_code: '+56' },
  { name: 'Colombia', state_nomenclature: 'Departamento', phone_code: '+57' }
]

countries.each do |country|
  Country.create(country)
end

countries = Country.all

#Create 5 (for every country) states (with name and country_id) of LATAM from an array

states = [
  { name: 'Buenos Aires', country_id: countries[0].id },
  { name: 'Catamarca', country_id: countries[0].id },
  { name: 'Chaco', country_id: countries[0].id },
  { name: 'Chubut', country_id: countries[0].id },
  { name: 'Córdoba', country_id: countries[0].id }, #next country bolivia
  { name: 'Chuquisaca', country_id: countries[1].id },
  { name: 'La Paz', country_id: countries[1].id },
  { name: 'Cochabamba', country_id: countries[1].id },
  { name: 'Oruro', country_id: countries[1].id },
  { name: 'Potosí', country_id: countries[1].id }, #next country chile
  { name: 'Arica y Parinacota', country_id: countries[2].id },
  { name: 'Tarapacá', country_id: countries[2].id },
  { name: 'Antofagasta', country_id: countries[2].id },
  { name: 'Atacama', country_id: countries[2].id },
  { name: 'Coquimbo', country_id: countries[3].id }, #next country colombia
  { name: 'Amazonas', country_id: countries[3].id },
  { name: 'Antioquia', country_id: countries[3].id},
  { name: 'Arauca', country_id: countries[3].id },
  { name: 'Atlántico', country_id: countries[3].id },
  { name: 'Bolívar', country_id: countries[3].id }
]

states.each do |state|
  State.create(state)
end

states = State.all

#refactor this next list of cities

cities = [
  { name: 'Adrogué', state_id: states[0].id },
  { name: 'Avellaneda', state_id: states[0].id },
  { name: 'Banfield', state_id: states[0].id },
  { name: 'Bernal', state_id: states[0].id },
  { name: 'Burzaco', state_id: states[0].id }, #next state catamarca
  { name: 'Ancasti', state_id: states[1].id },
  { name: 'Andalgalá', state_id: states[1].id },
  { name: 'Antofagasta de la Sierra', state_id: states[1].id },
  { name: 'Belén', state_id: states[1].id },
  { name: 'Capayán', state_id: states[1].id }, #next state chaco
  { name: 'Avia Terai', state_id: states[2].id },
  { name: 'Barranqueras', state_id: states[2].id },
  { name: 'Basail', state_id: states[2].id },
  { name: 'Campo Largo', state_id:states[2].id },
  { name: 'Capitán Solari', state_id: states[2].id }, #next state chubut
  { name: 'Comodoro Rivadavia', state_id: states[3].id },
  { name: 'Esquel', state_id: states[3].id },
  { name: 'Gaiman', state_id: states[3].id },
  { name: 'Lago Puelo', state_id: states[3].id },
  { name: 'Puerto Madryn', state_id: states[3].id }, #next state córdoba
  { name: 'Alta Gracia', state_id: states[4].id },
  { name: 'Bell Ville', state_id: states[4].id },
  { name: 'Córdoba', state_id: states[4].id },
  { name: 'Cosquín', state_id: states[4].id },
  { name: 'La Calera', state_id: states[4].id }, #next state chuquisaca
  { name: 'Camargo', state_id: states[5].id },
  { name: 'Huacareta', state_id: states[5].id },
  { name: 'Macharetí', state_id: states[5].id },
  { name: 'Monteagudo', state_id: states[5].id },
  { name: 'Padilla', state_id: states[5].id}, #next state la paz
  { name: 'Achocalla', state_id: states[6].id },
  { name: 'Ancoraimes', state_id: states[6].id },
  { name: 'Apolo', state_id: states[6].id },
  { name: 'Ayo Ayo', state_id: states[6].id },
  { name: 'Batallas', state_id: states[6].id }, #next state cochabamba
  { name: 'Arani', state_id: states[7].id },
  { name: 'Arque', state_id: states[7].id },
  { name: 'Ayopaya', state_id: states[7].id },
  { name: 'Bolívar', state_id: states[7].id },
  { name: 'Capinota', state_id: states[7].id }, #next state oruro
  { name: 'Caracollo', state_id: states[8].id },
  { name: 'Challapata', state_id: states[8].id },
  { name: 'Choquecota', state_id: states[8].id },
  { name: 'Coipasa', state_id: states[8].id },
  { name: 'Corque', state_id: states[8].id }, #next state potosí
  { name: 'Acasio', state_id: states[9].id },
  { name: 'Aiquile', state_id: states[9].id },
  { name: 'Alcalá', state_id: states[9].id },
  { name: 'Arampampa', state_id: states[9].id },
  { name: 'Betanzos', state_id: states[9].id }, #next state arica y parinacota
  { name: 'Arica', state_id: states[10].id },
  { name: 'Camarones', state_id: states[10].id },
  { name: 'Putre', state_id: states[10].id },
  { name: 'General Lagos', state_id: states[10].id },
  { name: 'Huara', state_id: states[10].id }, #next state tarapacá
  { name: 'Alto Hospicio', state_id: states[11].id },
  { name: 'Camiña', state_id: states[11].id },
  { name: 'Colchane', state_id: states[11].id },
  { name: 'Huara', state_id: states[11].id },
  { name: 'Iquique', state_id: states[11].id }, #next state antofagasta
  { name: 'Antofagasta', state_id: states[12].id },
  { name: 'Calama', state_id: states[12].id },
  { name: 'María Elena', state_id: states[12].id },
  { name: 'Mejillones', state_id: states[12].id },
  { name: 'Ollagüe', state_id: states[12].id }, #next state atacama
  { name: 'Alto del Carmen', state_id: states[13].id },
  { name: 'Caldera', state_id: states[13].id },
  { name: 'Chañaral', state_id: states[13].id },
  { name: 'Copiapó', state_id: states[13].id },
  { name: 'Diego de Almagro', state_id: states[13].id }, #next state coquimbo
  { name: 'Andacollo', state_id: states[14].id },
  { name: 'Canela', state_id: states[14].id },
  { name: 'Combarbalá', state_id: states[14].id },
  { name: 'Coquimbo', state_id: states[14].id },
  { name: 'Illapel', state_id: states[14].id }, #next state amazonas
  { name: 'El Encanto', state_id: states[15].id },
  { name: 'La Chorrera', state_id: states[15].id },
  { name: 'La Pedrera', state_id: states[15].id },
  { name: 'La Victoria', state_id: states[15].id },
  { name: 'Leticia', state_id: states[15].id }, #next state antioquia
  { name: 'Abejorral', state_id: states[16].id },
  { name: 'Abriaquí', state_id: states[16].id },
  { name: 'Alejandría', state_id: states[16].id },
  { name: 'Amagá', state_id: states[16].id },
  { name: 'Amalfi', state_id: states[16].id }, #next state arauca
  { name: 'Arauca', state_id: states[17].id },
  { name: 'Arauquita', state_id: states[17].id },
  { name: 'Cravo Norte', state_id: states[17].id },
  { name: 'Fortul', state_id: states[17].id },
  { name: 'Puerto Rondón', state_id: states[17].id }, #next state atlántico
  { name: 'Baranoa', state_id: states[18].id },
  { name: 'Barranquilla', state_id: states[18].id },
  { name: 'Campo de la Cruz', state_id: states[18].id },
  { name: 'Candelaria', state_id: states[18].id },
  { name: 'Galapa', state_id: states[18].id }, #next state bolívar
  { name: 'Achí', state_id: states[19].id },
  { name: 'Altos del Rosario', state_id: states[19].id },
  { name: 'Arenal', state_id: states[19].id },
  { name: 'Arjona', state_id: states[19].id },
  { name: 'Arroyohondo', state_id: states[19].id }
]

cities.each do |city|
  City.create(city)
end






