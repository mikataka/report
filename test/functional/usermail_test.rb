require 'test_helper'

class UsermailTest < ActionMailer::TestCase
  test "newuser" do
    mail = Usermail.newuser
    assert_equal "Newuser", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
