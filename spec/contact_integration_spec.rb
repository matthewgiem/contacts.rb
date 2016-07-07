require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

def expect_page(arr)
  arr.each() do |element|
    expect(page).to have_content(element)
  end
end

def create_a_contact (first, last, job, company)
  visit('/contacts/new')
  fill_in("first_name", :with => first)
  fill_in("last_name", :with => last)
  fill_in("job_title", :with => job)
  fill_in("company", :with => company)
  click_button("Create Contact!")
end


describe("viewing the root path", {:type => :feature}) do
  it('renders the index page') do
    visit('/')
    expect_page(['Contact Creator!', 'See All Contacts', 'Add a new Contact'])
  end

  it('renders the new contact form') do
    visit('/contacts/new')
    expect_page(['Add Contact', 'Create a new contact here:', 'First name:', 'Last name:', 'Job Title:', 'Company:'])
  end

  it('create a contact') do
    create_a_contact("Matthew", "Giem", "Computer Programmer", "Unemployed")
    visit('/contacts')
    expect_page(["Contacts", "Matthew", "Giem"])
  end

  it('creates a contact and shows the contacts page') do
    create_a_contact("James", "Williams", "Programmer", "Unemployed")
    visit('/contacts')
    click_link("James Williams")
    expect_page(["Phone Numbers"])
  end

  it('creates a phone number for a contact') do
    create_a_contact("Bucky", "Williams", "Programmer", "Unemployed")
    visit('/contacts')
    click_link("Bucky Williams")
    expect_page(["Phone Numbers"])
  end

  it('renders new phone form for a given contact') do
    create_a_contact("Joey", "Williams", "Programmer", "Unemployed")
    visit('/contacts')
    click_link("Joey Williams")
    # expect_page([])
    click_link("Add a Phone Number")
    # visit('')
    expect_page(["Add a new phone number"])
  end

end
