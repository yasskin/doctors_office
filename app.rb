require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
require('./lib/specialty')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "doctors_office_test"})

get('/') do
  erb(:index)
end

get('/specialties') do
  @specialties = Specialty.all()
  erb(:specialties)
end

post('/specialties') do
  name = params.fetch("specialty_name")
  specialty = Specialty.new({:id => nil, :name => name})
  specialty.save()
  erb(:success)
end

get('/specialties/:id') do
  @specialty = Specialty.find(params.fetch('id').to_i())
  erb(:specialty)
end

post('/doctors') do
  name = params.fetch('name')
  specialty_id = params.fetch('specialty_id').to_i()
  @specialty = Specialty.find(specialty_id)
  @doctor = Doctor.new({:id => nil, :name => name, :specialty_id => specialty_id})
  @doctor.save()
  erb(:success)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end

get('/doctors/:id') do
  @doctor = Doctor.find(params.fetch('id').to_i())
  erb(:doctor)
end
