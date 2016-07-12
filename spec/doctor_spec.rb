require('spec_helper')

describe(Doctor) do
  describe('.all') do
    it('starts off with no doctors') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a new doctor to the database") do
      test_doctor = Doctor.new({:id => nil, :name => "Fred", :specialty_id => 1})
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe("#name") do
    it("tells you the name of the doctor") do
      test_doctor = Doctor.new({:id => nil, :name => "Fred", :specialty_id => 1})
      expect(test_doctor.name()).to(eq("Fred"))
    end
  end

  describe("#id") do
    it("tells you the id of the doctor") do
      test_doctor = Doctor.new({:id => nil, :name => "Fred", :specialty_id => 1})
      test_doctor.save()
      expect(test_doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#specialty_id") do
    it("lets you read out the specialty id of the doctor") do
      test_doctor = Doctor.new({:id => nil, :name => "Fred", :specialty_id => 1})
      test_doctor.save()
      expect(test_doctor.specialty_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same doctor if it has the same information") do
      test_doctor = Doctor.new({:id => nil, :name => "Fred", :specialty_id => 1})
      test_doctor2 = Doctor.new({:id => nil, :name => "Fred", :specialty_id => 1})
      expect(test_doctor).to(eq(test_doctor2))
    end
  end

  describe('.find') do
    it('returns a doctor by an ID') do
      test_doctor = Doctor.new({:id => nil, :name => "Fred", :specialty_id => 1})
      test_doctor.save()
      test_doctor2 = Doctor.new({:id => nil, :name => "Mary", :specialty_id => 2})
      test_doctor2.save()
      expect(Doctor.find(test_doctor2.id())).to(eq(test_doctor2))
    end
  end

end
