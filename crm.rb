require_relative 'contact'
require_relative 'rolodex'
require 'faker'
require 'sinatra'

@@rolodex=Rolodex.new

20.times do 
	contact = Contact.new(Faker::Name.first_name,
			Faker::Name::last_name,
			Faker::Internet.email,
			"Good Stuff")
	@@rolodex.add_contact(contact)
end


get '/' do
  @crm_app_name = "My CRM"
  erb(:index)
end


get '/contacts' do
	@contacts = @@rolodex.contacts

  erb(:contacts)
end

get '/contacts/new' do
  erb(:new_contact)
end

get '/contacts/:id' do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else 
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
    @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @@rolodex.delete(params[:id].to_i)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end



post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.add_contact(new_contact)
  redirect to('/contacts')
end