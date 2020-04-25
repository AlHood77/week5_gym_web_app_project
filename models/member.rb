class Member

    attr_reader :first_name, :last_name, :date_of_birth, :membership_type

    def initialize(first_name, last_name, date_of_birth, membership_type)
        @first_name = first_name
        @last_name = last_name
        @date_of_birth = date_of_birth
        @membership_type = membership_type
    end


    
end