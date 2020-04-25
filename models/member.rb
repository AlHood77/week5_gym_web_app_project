class Member

    attr_reader :id, :first_name, :last_name, :date_of_birth, :membership_type

    def initialize(id, first_name, last_name, date_of_birth, membership_type)
        @id = id
        @first_name = first_name
        @last_name = last_name
        @date_of_birth = date_of_birth
        @membership_type = membership_type
    end


    
end