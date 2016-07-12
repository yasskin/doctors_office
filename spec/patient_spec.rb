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

  describe("#==") do
    it("is the same patient if it has the same attributes") do
      test_patient = Patient.new({:id => nil, :patient_name => "Gertrude", :patient_birthday => "1980-08-08", :doctor_id => 1})
      test_patient2 = Patient.new({:id => nil, :patient_name => "Gertrude", :patient_birthday => "1980-08-08", :doctor_id => 1})
      expect(test_patient).to(eq(test_patient2))
    end
  end

  describe(".find") do
    it('returns a patient using their id') do
      test_patient = Patient.new({:id => nil, :patient_name => "Gertrude", :patient_birthday => "1980-08-08", :doctor_id => 1})
      test_patient.save()
      test_patient2 = Patient.new({:id => nil, :patient_name => "Billy", :patient_birthday => "1980-08-03", :doctor_id => 1})
      test_patient2.save()
      expect(Patient.find(test_patient2.id())).to(eq(test_patient2))
    end
  end

end
