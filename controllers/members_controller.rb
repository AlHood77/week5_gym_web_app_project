require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do
    @members = Member.all()
    erb ( :"members/index" )
end

get '/members/new' do
    erb ( :"members/new" )
end

get '/members/:id' do
    @member = Member.find( params[:id] )
    erb ( :"members/show" )
end

post '/members' do
    @member = Member.new(params)
    @member.save()
    erb ( :"members/create" )
end