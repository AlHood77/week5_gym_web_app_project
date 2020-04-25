class Activity

    attr_reader :category, :date, :time, :number_of_spaces, :registered_members
    attr_accessor :registered_members

    def initialize(category, date, time, number_of_spaces)
        @category = category
        @date = date
        @time = time
        @number_of_spaces = number_of_spaces
        @registered_members = []
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
    end

    def spaces_available(activity)
        @number_of_spaces - members_registered
    end

    def cancel_activity()
        @registered_members.clear()
    end




    
    # def fully_booked ()
    #     if members_registered >= number_of_spaces
    #         return "Fully Booked"
    #     else
    #         register_member_on_activity
    #     end
    # end

     #Done by SQL?
    # def remove_member_by_id(member)
    #     p @registered_members.delete_if { |member| member.id == [:id] }
    # end

 

end
