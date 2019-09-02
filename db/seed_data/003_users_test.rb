puts '###### usuarios de prueba'


#### PRUEBAS CON USUARIOS ADMIN ####
#este user es ADMIN y no pertenece a ninguna clinica = SI debería ver todas las clínicas
User.create!(email: 'admin@clinicaolivos.com.ar', first_name: 'A', last_name: 'X', role: 'admin', password: '123qwe', phone: nil)

#este user es ADMIN y pertenece a la clinica 1 = NO debería ver todas las clinics. solo la Clínica 1
User.create!(email: 'admin_cl1@clinicaolivos.com.ar', clinic_id: 1, first_name: 'A', last_name: 'X', role: 'admin', password: '123qwe', phone: nil)

#### PRUEBAS CON USUARIOS SUPERVISOR ####
#este user es SUPERVISOR y no pertenece a ninguna clinica = NO debería ver ninguna clínica.
User.create!(email: 'super@clinicaolivos.com.ar', first_name: 'A', last_name: 'X', role: 'supervisor', password: '123qwe', phone: nil)

#este user es SUPERVISOR y pertenece a la clinica 1 = NO debería ver todas las clinics. solo la Clínica 1
User.create!(email: 'super_cl1@clinicaolivos.com.ar', clinic_id: 1, first_name: 'A', last_name: 'X', role: 'supervisor', password: '123qwe', phone: nil)

#este user es SUPERVISOR y pertenece a la clinica 2 = NO debería ver todas las clinics. solo la Clínica 2
User.create!(email: 'super_cl2@clinicaolivos.com.ar', clinic_id: 2, first_name: 'A', last_name: 'X', role: 'supervisor', password: '123qwe', phone: nil)

