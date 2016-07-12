class Patient
  attr_reader(:id, :patient_name, :patient_birthday, :doctor_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @patient_name = attributes.fetch(:patient_name)
    @patient_birthday = attributes.fetch(:patient_birthday)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  define_singleton_method(:all) do
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      id = patient.fetch("id").to_i()
      patient_name = patient.fetch("name")
      patient_birthday = patient.fetch("birthday")
      doctor_id = patient.fetch("doctor_id").to_i()
      patients.push(Patient.new({:id => id, :patient_name => patient_name, :patient_birthday => patient_birthday, :doctor_id => doctor_id}))
    end
    patients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patients (name, birthday, doctor_id) VALUES ('#{@patient_name}', '#{@patient_birthday}', #{@doctor_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_patient|
    self.id().==(another_patient.id()).&(self.patient_name().==(another_patient.patient_name())).&(self.patient_birthday().==(another_patient.patient_birthday())).&(self.doctor_id().==(another_patient.doctor_id()))
  end

end
