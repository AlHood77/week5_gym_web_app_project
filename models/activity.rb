class Activity

    attr_reader :category, :date, :time, :number_of_spaces

    def initialize(category, date, time, number_of_spaces)
        @category = category
        @date = date
        @time = time
        @number_of_spaces = number_of_spaces
        @registered_members = []
    end

end
