require_relative( "../models/member.rb")
require_relative( "../models/activity.rb")
require_relative( "../models/booking.rb")
require("pry")

Member.delete_all()
Activity.delete_all()

member1 = Member.new({'first_name' => 'Alan', 'last_name' => 'Hood', 'date_of_birth' => "1977/12/27", 'membership_type' => 'Gold'})

member1.save()

member2 = Member.new({'first_name' => 'Hazel', 'last_name' => 'Ruzive', 'date_of_birth' => "1980/02/24", 'membership_type' => 'Standard'})

member2.save()

member3 = Member.new({'first_name' => 'Dave', 'last_name' => 'Jones', 'date_of_birth' => "1985/05/20", 'membership_type' => 'Silver'})

member3.save()

member4 = Member.new({'first_name' => 'Sally', 'last_name' => 'Geldard', 'date_of_birth' => "1988/06/15", 'membership_type' => 'Standard'})

member4.save()

member5 = Member.new({'first_name' => 'Paul', 'last_name' => 'McCormack', 'date_of_birth' => "1978/03/01", 'membership_type' => 'Bronze'})

member5.save()




activity1 = Activity.new({'category' => 'Pilates', 'activity_date' => '2020/05/01', 'activity_time' => '1200', 'number_of_spaces' => 10})

activity1.save()

activity2 = Activity.new({'category' => 'Yoga', 'activity_date' => '2020/05/02', 'activity_time' => '1400', 'number_of_spaces' => 8})

activity2.save()

activity3 = Activity.new({'category' => 'Boot Camp', 'activity_date' => '2020/05/03', 'activity_time' => '1400', 'number_of_spaces' => 15})

activity3.save()

activity4 = Activity.new({'category' => 'CrossFit', 'activity_date' => '2020/05/04', 'activity_time' => '1400', 'number_of_spaces' => 5})

activity4.save()

activity5 = Activity.new({'category' => 'Spinning', 'activity_date' => '2020/05/05', 'activity_time' => '1400', 'number_of_spaces' => 6})

activity5.save()

booking1 = Booking.new({'member_id' => member1.id, 'activity_id' => activity1.id})
booking1.save()








binding.pry 
nil