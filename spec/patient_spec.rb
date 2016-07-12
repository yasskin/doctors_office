require('spec_helper')

describe(Patient) do
  describe(".all") do
    it("initializes an empty array of patients") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a patient to the array of saved patients") do
      test_patient = Patient.new({:id => nil, :patient_name => "Gertrude", :patient_birthday => "1980-08-08", :doctor_id => 1})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe("#id") do
    it("sets its id when you save it") do
      test_patient = Patient.new({:id => nil, :patient_name => "Gertrude", :patient_birthday => "1980-08-08", :doctor_id => 1})
      test_patient.save()
      expect(test_patient.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same patient if it has the same attributes") do
      test_patient = Patient.new({:id => nil, :patient_name => "Gertrude", :patient_birthday => "1980-08-08", :doctor_id => 1})
      test_patient2 = Patient.new({:id => nil, :patient_name => "Gertrude", :patient_birthday => "1980-08-08", :doctor_id => 1})
      expect(test_patient).to(eq(test_patient2))
    end
  end

end
