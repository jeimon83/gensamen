# frozen_string_literal: true

puts '###### cargando la checklist en config'
Config.create(checklist: { tipo1: ['paso1', 'paso2'], tipo2: ['paso3', 'paso4'] } )
