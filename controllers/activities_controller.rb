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
    erb ( :"activities/show" )
end