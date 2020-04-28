require_relative( '../db/sql_runner' )

class Activity

    attr_reader( :id ) 
    attr_accessor( :category, :activity_date, :activity_time, :number_of_spaces, :registered_members )

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @category = options ['category']
        @activity_date = options ['activity_date']
        @activity_time = options ['activity_time']
        @number_of_spaces = options ['number_of_spaces'].to_i
        @registered_members = []
    end
    
    def save()
        sql = "INSERT INTO activities
        (
            category,
            activity_date,
            activity_time,
            number_of_spaces
        )
        VALUES
        (
            $1, $2, $3, $4
        )
        RETURNING id"
        values = [@category, @activity_date, @activity_time, @number_of_spaces]
        results = SqlRunner.run(sql, values)
        @id = results.first()['id'].to_i
    end

    def update()
        sql = "UPDATE activities
        SET
        (
            category,
            activity_date,
            activity_time,
            number_of_spaces 
        ) =
        (
            $1, $2, $3, $4
        )
        WHERE id = $5"
        values = [@category, @activity_date, @activity_time, @number_of_spaces, @id]
        SqlRunner.run(sql, values)
    end

    def members()
        sql = "SELECT members.*
        FROM members
        INNER JOIN bookings
        ON bookings.member_id = members.id
        WHERE activity_id = $1"
        values = [@id]
        member_data = SqlRunner.run(sql, values)
        return Member.map_items(member_data)
    end

    def delete()
        sql = "DELETE FROM activities
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all 
        sql = "SELECT * FROM activities"
        activity_data = SqlRunner.run(sql)
        activities = map_items(activity_data)
        return activities
    end

    def self.find(id)
        sql = "SELECT *
        FROM activities
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        activity_hash = results.first
        activity = Activity.new(activity_hash)
        return activity
    end

    def self.delete_all()
        sql = "DELETE from activities"
        SqlRunner.run(sql)
    end

    def self.map_items(activity_data)
        return activity_data.map { |activity| Activity.new(activity)}
    end


    def members_registered()
         @registered_members.count()
    end

    def register_member_on_activity(member)
       if members_registered >= number_of_spaces
            return "Fully Booked"
        else
            @registered_members.push(member)
        end 
        update()
        
    end

    def spaces_available(activity)
        @number_of_spaces - members_registered()
        
    end

    def cancel_activity()
        @registered_members.clear()
    end

    def remove_member_from_activity_by_id(member, id)
        p @registered_members.delete_if { |member| member.id == id  }
    end


end

