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

end
