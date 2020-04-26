require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do #index
    @members = Member.all()
    erb ( :"members/index" )
end

get '/members/new' do #new
    erb ( :"members/new" )
end

get '/members/:id' do #show
    @member = Member.find( params[:id] )
    erb ( :"members/show" )
end

post '/members' do #create
    @member = Member.new(params)
    @member.save()
    erb ( :"members/create" )
end

get '/members/:id/edit' do #edit
    @member = Member.find( params[:id] )
    erb ( :"members/edit" )
end

post '/members/:id' do #update
    Member.new( params ).update
    redirect to '/members'
end

post '/members/:id/delete' do #delete
    member = Member.find( params[:id] )
    member.delete()
    redirect to '/members'
end


