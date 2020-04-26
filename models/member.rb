require_relative( '../db/sql_runner' )

class Member

    attr_reader( :id )
    attr_accessor( :first_name, :last_name, :date_of_birth, :membership_type )

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

    def delete()
        sql = "DELETE FROM members
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all
        sql = "SELECT * FROM members"
        member_data = SqlRunner.run(sql)
        members = map_items(member_data)
        return members
    end

    def self.find(id)
        sql = "SELECT *
        FROM members
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        member_hash = results.first
        member = Member.new(member_hash)
        return member
    end

    def self.delete_all()
        sql = "DELETE from members"
        SqlRunner.run(sql)
    end

    def self.map_items(member_data)
        return member_data.map { |member| Member.new(member)}
    end


    
end




    # attr_reader :id, :first_name, :last_name, :date_of_birth, :membership_type


    # def initialize(id, first_name, last_name, date_of_birth, membership_type)
    #     @id = id
    #     @first_name = first_name
    #     @last_name = last_name
    #     @date_of_birth = date_of_birth
    #     @membership_type = membership_type
    # end