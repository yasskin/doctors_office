require('spec_helper')

describe(Doctor) do
  describe('.all') do
    it('starts off with no doctors') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the name of the doctor") do
      test_doctor = Doctor.new({:id => nil, :name => "Fred", :specialty_id => nil})
      expect(test_doctor.name()).to(eq("Fred"))
    end
  end

end
