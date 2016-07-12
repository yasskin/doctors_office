require('spec_helper')

describe(Specialty) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Specialty.all()).to(eq([]))
    end
  end
end
