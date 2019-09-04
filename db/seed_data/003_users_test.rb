puts '###### usuarios de prueba'

#este user es ADMIN y no pertenece a ninguna clinica = SI debería ver todas las clínicas
User.create!(email: 'admin@clinicaolivos.com.ar', first_name: 'A', last_name: 'X', role: 'admin', password: '123qwe', phone: nil)

#este user es ADMIN y pertenece a la clinica 1 = Solo ve la Clínica 1
User.create!(email: 'admin_cl1@clinicaolivos.com.ar', clinic_id: 1, first_name: 'A', last_name: 'X', role: 'admin', password: '123qwe', phone: nil)

#este user es SUPERVISOR y no pertenece a ninguna clinica = SI debería ver todas las clínicas.
User.create!(email: 'super@clinicaolivos.com.ar', first_name: 'A', last_name: 'X', role: 'supervisor', password: '123qwe', phone: nil)

#este user es SUPERVISOR y pertenece a la clinica 1 = Solo ve la Clínica 1
User.create!(email: 'super_cl1@clinicaolivos.com.ar', clinic_id: 1, first_name: 'A', last_name: 'X', role: 'supervisor', password: '123qwe', phone: nil)

#este user es SUPERVISOR y pertenece a la clinica 2 = Solo ve la Clínica 2
User.create!(email: 'super_cl2@clinicaolivos.com.ar', clinic_id: 2, first_name: 'A', last_name: 'X', role: 'supervisor', password: '123qwe', phone: nil)

