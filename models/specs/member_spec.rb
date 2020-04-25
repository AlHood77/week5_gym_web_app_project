require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../member.rb')

class MemberTest < MiniTest::Test

    def setup()
        @member = Member.new(001, "Alan", "Hood", "27/12/1977", "Standard")
    end

    def test_can_create_member()
        assert_equal(Member, @member.class())
    end

    def test_member_can_have_id()
        assert_equal(001, @member.id)
    end

    def test_member_can_have_first_name()
        assert_equal("Alan", @member.first_name())
    end

    def test_member_can_have_last_name()
        assert_equal("Hood", @member.last_name())
    end

    def test_member_can_have_dob()
        assert_equal("27/12/1977", @member.date_of_birth())
    end

    def test_member_can_have_membership_type()
        assert_equal("Standard", @member.membership_type())
    end

end