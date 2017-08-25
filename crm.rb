require_relative 'contact.rb'
require 'sinatra'


get '/' do
  erb :index
end


get '/contacts/' do
  @contacts=Contact.all
  erb :contacts
end

get '/contacts/new' do
 erb :new
end

get '/contacts/:id' do
  # params[:id] contains the id from the URL
   @contact = Contact.find_by({id: params[:id].to_i})
   if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/about' do
  erb :about
end



after do
  ActiveRecord::Base.connection.close
end
