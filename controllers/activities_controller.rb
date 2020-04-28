require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/activity.rb' )


also_reload( '../models/*')

get '/activities' do #index
    @activities = Activity.all()
    erb ( :"activities/index" )
end

get '/activities/new' do #new
    erb ( :"activities/new" )
end

get '/activities/:id' do #show
    @activity = Activity.find( params[:id] )
    @members = @activity.members()
    erb ( :"activities/show" )
end

post '/activities' do #create
    @activity = Activity.new(params)
    @activity.save()
    erb ( :"activities/create" )
end

get '/activities/:id/edit' do #edit
    @activity = Activity.find( params[:id] )
    erb ( :"activities/edit" )
end

post '/activities/:id' do #update
    Activity.new( params ).update
    redirect to '/activities'
end

post '/activities/:id/delete' do #delete
    activity = Activity.find( params[:id] )
    activity.delete()
    redirect to '/activities'
end