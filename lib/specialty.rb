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
      returned_specialties.push(Specialty.new({:id => id, :name => name}))
    end
    specialties
  end

  define_method(:==) do |another_specialty|
    self.id().==(another_specialty.id()).&(self.name().==(another_specialty.name()))
  end


end
