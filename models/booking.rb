require_relative( '../db/sql_runner' )

class Booking

    attr_reader ( :member_id, :activity_id, :id )

    def initialize ( options )
        @id = options['id'].to_i if options['id']
        @member_id = options['member_id'].to_i
        @activity_id = options['activity_id'].to_i
    end




end
