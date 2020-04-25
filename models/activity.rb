require_relative( '../db/sql_runner' )

class Activity

    attr_reader ( :category, :date, :time, :number_of_spaces, :registered_members, :id )


    def initialize( options )
        @id = options['id'].to_i if options['id']
        @category = options ['category']
        @date = options ['date']
        @time = options ['time']
        @number_of_spaces = options ['number_of_spaces'].to_i
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





  

     #Done by SQL?
    # def remove_member_by_id(member)
    #     p @registered_members.delete_if { |member| member.id == [:id] }
    # end

 

end
