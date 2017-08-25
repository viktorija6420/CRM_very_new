require_relative 'contact.rb'
require 'sinatra'


get '/' do
  erb :index
end


get '/contacts' do
  @contacts=Contact.all
  erb :contacts
end

get '/contacts' do
  @contacts=Contact.all
  erb :contacts
  redirect to('/')
end


get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
