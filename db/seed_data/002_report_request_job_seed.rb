# frozen_string_literal: true

puts '###### cargando algunas clínicas'
clinics_data = [
  { name: 'Clínica 01 Hudson', cuit: '1111', habilitation: '0000' },
  { name: 'Clínica 02 Olivos', cuit: '2222', habilitation: '0000' },
  { name: 'Clínica 03 Nuñez',  cuit: '3333', habilitation: '0000' },
  { name: 'Clínica 04 Centro', cuit: '4444', habilitation: '0000' }
]
clinics_data.each do |clinic_data|
  puts "-> #{clinic_data[:name]}"
  Clinic.create!(clinic_data)
end

puts '###### cargando algunos pacientes'
patients_data = [
  { firstname: 'Maria',    lastname: 'Pillud',   clinic_id: 1  },
  { firstname: 'Luisa',    lastname: 'Torrent',  clinic_id: 1  },
  { firstname: 'Javier',    lastname: 'García',  clinic_id: 1  },
  { firstname: 'Micaela',  lastname: 'Donatti',  clinic_id: 1  },
  { firstname: 'Juan',     lastname: 'López',    clinic_id: 2  },
  { firstname: 'Fernando', lastname: 'Rakitich', clinic_id: 3  },
  { firstname: 'Lionel',   lastname: 'Messi',    clinic_id: 4  }
]
patients_data.each do |patient_data|
  puts "-> #{patient_data[:firstname]} #{patient_data[:lastname]}"
  Patient.create!(patient_data)
end

puts '###### cargando algunas internaciones'
internments_data = [
  { begin_date: '04/09/2019', type: 'Judicial',   patient_id: 1, end_date: nil },
  { begin_date: '20/09/2019', type: 'Judicial',   patient_id: 2, end_date: nil },
  { begin_date: '26/09/2019', type: 'Voluntaria', patient_id: 3, end_date: '25/10/2019' },
  { begin_date: '04/09/2019', type: 'Voluntaria', patient_id: 4, end_date: nil },
  { begin_date: '15/09/2019', type: 'Voluntaria', patient_id: 5, end_date: nil },
  { begin_date: '15/09/2019', type: 'Voluntaria', patient_id: 6, end_date: nil },
  { begin_date: '15/09/2019', type: 'Voluntaria', patient_id: 7, end_date: nil }

]
internments_data.each do |internment_data|
  puts "-> Fecha #{internment_data[:begin_date]} - Tipo #{internment_data[:type]}"
  Internment.create!(internment_data)
end
