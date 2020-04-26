require_relative( "../models/member.rb")
require_relative( "../models/activity.rb")
require_relative( "../models/booking.rb")
require("pry")

Member.delete_all()

member1 = Member.new({'first_name' => 'Alan', 'last_name' => 'Hood', 'date_of_birth' => "1977/12/27", 'membership_type' => 'Gold'})

member1.save()

member2 = Member.new({'first_name' => 'Hazel', 'last_name' => 'Ruzive', 'date_of_birth' => "1980/02/24", 'membership_type' => 'Standard'})

member2.save()









binding.pry 
nil