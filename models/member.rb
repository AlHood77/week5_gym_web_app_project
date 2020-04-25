require_relative( '../db/sql_runner' )

class Member

    attr_reader ( :first_name, :last_name, :date_of_birth, :membership_type, :id )

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @date_of_birth = options['date_of_birth']
        @membership_type = options ['membership_type']
    end


    
end