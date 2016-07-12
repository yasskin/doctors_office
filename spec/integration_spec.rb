require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('view a specialty', {:type => :feature}) do
  it('allows a user to add a specialty add a doctor') do
    test_specialty = Specialty.new({:id => nil, :name => 'Podiatry'})
    test_specialty.save()
    test_doctor = Doctor.new({:id => nil, :name => 'Fred', :specialty_id => test_specialty.id()})
    test_doctor.save()
    visit('/specialties')
    click_link(test_specialty.name())
    expect(page).to have_content(test_doctor.name())
  end
end
