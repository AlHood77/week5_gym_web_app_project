class Activity

    attr_reader :category, :date, :time, :number_of_spaces, :registered_members

    def initialize(category, date, time, number_of_spaces)
        @category = category
        @date = date
        @time = time
        @number_of_spaces = number_of_spaces
        @registered_members = []
    end

    def members_registered()
        @registered_members.length()
    end

    def register_member_on_activity(member)
        @registered_members.push(member)
    end

    def cancel_activity()
        @registered_members.clear()
    end

end
