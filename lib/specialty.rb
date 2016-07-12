class Specialty
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_specialties = DB.exec("SELECT * FROM specialties;")
    specialties = []
    returned_specialties.each() do |specialty|
      id = specialty.fetch("id").to_i()
      name = specialty.fetch("name")
      specialties.push(Specialty.new({:id => id, :name => name}))
    end
    specialties
  end

  define_method(:==) do |another_specialty|
    self.id().==(another_specialty.id()).&(self.name().==(another_specialty.name()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO specialties (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_specialty = nil
    Specialty.all().each() do |specialty|
      if specialty.id().==(id)
          found_specialty = specialty
      end
    end
    found_specialty
  end

  define_method(:doctors) do
    specialty_doctors = []
    doctors = DB.exec("SELECT * FROM doctors WHERE specialty_id = #{self.id()};")
    doctors.each() do |doctor|
      id = doctor.fetch("id").to_i()
      name = doctor.fetch("name")
      specialty_id = doctor.fetch("specialty_id").to_i()
      specialty_doctors.push(Doctor.new({:id => id, :name => name, :specialty_id => specialty_id}))
    end
    specialty_doctors
  end
end
