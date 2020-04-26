require_relative( '../db/sql_runner' )

class Member

    attr_reader( :first_name, :last_name, :date_of_birth, :membership_type, :id )

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @date_of_birth = options['date_of_birth']
        @membership_type = options ['membership_type']
    end

    def save()
        sql = "INSERT INTO members
        (
            first_name,
            last_name,
            date_of_birth,
            membership_type
        )
        VALUES
        (
            $1, $2, $3, $4
        )
        RETURNING id"
        values = [@first_name, @last_name, @date_of_birth, @membership_type]
        results = SqlRunner.run(sql, values)
        @id = results.first()['id'].to_i
    end

    def update()
        sql = "UPDATE members
        SET
        (
            first_name,
            last_name,
            date_of_birth,
            membership_type
        ) =
        (
            $1, $2, $3, $4
        )
        WHERE id = $5"
        values = [@first_name, @last_name, @date_of_birth, @membership_type, @id]
        SqlRunner.run(sql, values)
    end


    
end