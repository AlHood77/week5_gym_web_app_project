require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../activity.rb')
require_relative('../member.rb')

class ActivityTest < MiniTest::Test

    def setup()
        @activity = Activity.new("Pilates", "01 May 2020", "1200", 3)
        @activity2 = Activity.new("Yoga", "02 May 2020", "1300", 10)
        @member1 = Member.new(1, "Brian", "King", "01 Jan 1980", "Gold")
        @member2 = Member.new(2, "Paul", "McCormack", "01 Feb 1978", "Standard")
        @member3 = Member.new(3, "Hazel", "Ruzive", "24 Feb 1980", "Silver")
        @member4 = Member.new(4, "Alan", "Logan", "13 Oct 1977", "Gold")
    end

    def test_can_create_activity()
        assert_equal(Activity, @activity.class())
    end

    def test_activity_can_have_category
        assert_equal("Pilates", @activity.category)
    end

    def test_activity_can_have_date
        assert_equal("01 May 2020", @activity.date)
    end

    def test_activity_can_have_time
        assert_equal("1200", @activity.time)
    end

    def test_activity_can_have_number_of_spaces
        assert_equal(3, @activity.number_of_spaces)
    end

    def test_activity_can_have_no_one_registered
        assert_equal(0, @activity.members_registered)
    end

    def test_member_can_be_registered_for_activity__when_spaces
        @activity.register_member_on_activity(@member1)
        assert_equal(1, @activity.members_registered())
    end

    def test_member_can_be_registered_for_activity__when_full
        @activity.register_member_on_activity(@member1)
        @activity.register_member_on_activity(@member2)
        @activity.register_member_on_activity(@member3)
        assert_equal("Fully Booked", @activity.register_member_on_activity(@member4))
    end
 
    def test_can_register_multiple_members_for_activity
        @activity.register_member_on_activity(@member1)
        @activity.register_member_on_activity(@member2)
        @activity.register_member_on_activity(@member3)
        assert_equal(3, @activity.members_registered())
    end

    def test_space_available_in_actvity()
        @activity2.register_member_on_activity(@member1)
        @activity2.register_member_on_activity(@member2)
        assert_equal(8, @activity2.spaces_available(@activity2))
    end

    def test_can_cancel_activity
        @activity.register_member_on_activity(@member1)
        @activity.register_member_on_activity(@member2)
        @activity.register_member_on_activity(@member3)
        @activity.cancel_activity
        assert_equal(0, @activity.members_registered())
    end

    

     #Done by SQL?
    # def test_remove_member_from_activity_by_id
    #     @activity.register_member_on_activity(@member1)
    #     @activity.register_member_on_activity(@member2)
    #     @activity.remove_member_by_id(@member2)
    #     assert_equal(1, @activity.members_registered())
    # end
   

end