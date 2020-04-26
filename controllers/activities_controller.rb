require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( '../models/activity.rb' )
also_reload( '../models/*')

get '/activities' do
    @activities = Activity.all()
    erb( :index )
end