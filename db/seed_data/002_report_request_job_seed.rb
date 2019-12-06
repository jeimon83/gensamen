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
  { firstname: 'Maria',    lastname: 'Pillud',   document_number: '30777880', clinic_id: 1  },
  { firstname: 'Luisa',    lastname: 'Torrent',  document_number: '30777881', clinic_id: 1  },
  { firstname: 'Javier',   lastname: 'García',   document_number: '30777882', clinic_id: 1  },
  { firstname: 'Micaela',  lastname: 'Donatti',  document_number: '30777883', clinic_id: 1  },
  { firstname: 'Juan',     lastname: 'López',    document_number: '30777884', clinic_id: 2  },
  { firstname: 'Fernando', lastname: 'Rakitich', document_number: '30777885', clinic_id: 3  },
  { firstname: 'Lionel',   lastname: 'Messi',    document_number: '30777886', clinic_id: 4  }
]
patients_data.each do |patient_data|
  puts "-> #{patient_data[:firstname]} #{patient_data[:lastname]}"
  Patient.create!(patient_data)
end

puts '###### cargando algunas internaciones'
internments_data = [
  { begin_date: '05/09/2019', type: 'Judicial',   patient_id: 1, end_date: nil },
  { begin_date: '20/09/2019', type: 'Judicial',   patient_id: 2, end_date: nil },
  { begin_date: '26/09/2019', type: 'Voluntaria', patient_id: 3, end_date: '25/10/2019' },
  { begin_date: '05/09/2019', type: 'Voluntaria', patient_id: 4, end_date: nil },
  { begin_date: '15/09/2019', type: 'Voluntaria', patient_id: 5, end_date: nil },
  { begin_date: '15/09/2019', type: 'Voluntaria', patient_id: 6, end_date: nil },
  { begin_date: '15/09/2019', type: 'Voluntaria', patient_id: 7, end_date: nil }
]
internments_data.each do |internment_data|
  puts "-> Fecha #{internment_data[:begin_date]} - Tipo #{internment_data[:type]}"
  Internment.create!(internment_data)
end

puts '###### cargando algunos Report Requests'
reportrequests_data = [
  { clinic_id: 1, patient_id: 1, requested_date: '03/03/2020', type: 'manual' },
  { clinic_id: 2, patient_id: 4, requested_date: '03/03/2020', type: 'manual' },
  { clinic_id: 3, patient_id: 7, requested_date: '03/03/2020', type: 'manual' }
]
reportrequests_data.each do |reportrequest_data|
  puts "-> Fecha #{reportrequest_data[:requested_date]} - Tipo #{reportrequest_data[:type]}"
  ReportRequest.create!(reportrequest_data)
end
