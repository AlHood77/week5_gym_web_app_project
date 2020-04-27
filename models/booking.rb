require_relative( '../db/sql_runner' )

class Booking

    attr_reader(  :id )
    attr_accessor( :member_id, :activity_id )

    def initialize ( options )
        @id = options['id'].to_i if options['id']
        @member_id = options['member_id'].to_i
        @activity_id = options['activity_id'].to_i
    end

    def save()
        sql = "INSERT INTO bookings
        (
            member_id,
            activity_id
        )
        VALUES
        (
            $1, $2
        )
        RETURNING id"
        values = [@member_id, @activity_id]
        booking = SqlRunner.run(sql, values).first
        @id = booking['id'].to_i
    end

    def member()
        sql = "SELECT *
        FROM members
        WHERE id = $1"
        values = [@member_id]
        member = SqlRunner.run(sql, values).first
        return Member.new(member)
    end

    def activity()
        sql = "SELECT *
        FROM activities
        WHERE id = $1"
        values = [@activity_id]
        activity = SqlRunner.run(sql, values).first
        return Activity.new(activity)
    end

    def self.all()
        sql = "SELECT * FROM bookings"
        booking_data = SqlRunner.run(sql)
        return Booking.map_items(booking_data)
    end

    def self.find(id)
        sql = "SELECT *
        FROM bookings
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        booking_hash = results.first
        booking = Booking.new(booking_hash)
        return booking
    end

    def self.delete_all()
        sql = "DELETE FROM bookings"
        SqlRunner.run(sql)
    end

    def self.map_items(booking_data)
        result = booking_data.map { |booking| Booking.new( booking )}
        return result
    end




end
