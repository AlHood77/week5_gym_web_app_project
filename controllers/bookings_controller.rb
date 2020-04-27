require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*')

get '/bookings' do #index
    @bookings = Booking.all()
    erb ( :"bookings/index" )
end

get '/bookings/new' do #new
    erb ( :"bookings/new" )
end

get '/bookings/:id' do #show
    @booking = Booking.find( params[:id] )
    erb ( :"bookings/show" )
end

post '/bookings' do #create
    @booking = Booking.new(params)
    @booking.save()
    erb ( :"bookings/create" )
end

get '/bookings/:id/edit' do #edit
    @booking = Booking.find( params[:id] )
    erb ( :"bookings/edit" )
end

post '/bookings/:id' do #update
    booking.new( params ).update
    redirect to '/bookings'
end

post '/bookings/:id/delete' do #delete
    booking = Booking.find( params[:id] )
    booking.delete()
    redirect to '/bookings'
end
