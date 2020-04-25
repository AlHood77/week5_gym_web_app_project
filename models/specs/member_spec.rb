require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../member.rb')

class MemberTest < MiniTest::Test

    def setup()
        @member = Member.new("Alan", "Hood", "27/12/1977", "Standard")
    end

    def test_can_create_member()
        assert_equal(Member, @member.class())
    end

    def test_member_can_have_first_name()
        assert_equal("Alan", @member.first_name())
    end

end