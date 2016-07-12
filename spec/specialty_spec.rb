require('spec_helper')

describe(Specialty) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Specialty.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same speciality if it has the same name") do
      specialty1 = Specialty.new({:id => nil, :name => "Podiatry"})
      specialty2 = Specialty.new({:id => nil, :name => "Podiatry"})
      expect(specialty1).to(eq(specialty2))
    end
  end

  describe("#save") do
    it("lets you save specialties to the database") do
      specialty = Specialty.new({:id => nil, :name => "Podiatry"})
      specialty.save()
      expect(Specialty.all()).to(eq([specialty]))
    end
  end

  describe(".find") do
    it("returns a specialty by its ID") do
      specialty1 = Specialty.new({:id => nil, :name => "Podiatry"})
      specialty1.save()
      specialty2 = Specialty.new({:id => nil, :name => "Surgery"})
      specialty2.save()
      expect(Specialty.find(specialty2.id())).to(eq(specialty2))
    end
  end

  describe("#doctors") do
    it('returns an array of doctors in the specialty') do
      specialty = Specialty.new({:id => nil, :name => "Podiatry"})
      specialty.save()
      test_doctor = Doctor.new({:id => nil, :name => "Fred", :specialty_id => specialty.id()})
      test_doctor.save()
      test_doctor2 = Doctor.new({:id => nil, :name => "Mary", :specialty_id => specialty.id()})
      test_doctor2.save()
      expect(specialty.doctors()).to(eq([test_doctor, test_doctor2]))
    end
  end

end
