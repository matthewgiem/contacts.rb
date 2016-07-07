require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/email_addresses')
require('./lib/mailing_addresses')
require('./lib/phone_numbers')

get('/') do
  erb(:index)
end

get('/contacts/new') do
  erb(:contact_form)
end

post('/contacts') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job_title = params.fetch("job_title")
  company = params.fetch("company")
  new_contact = Contact.new({:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company})
  new_contact.save()
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

get('/contacts/:id/phones/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:phone_form)
end
