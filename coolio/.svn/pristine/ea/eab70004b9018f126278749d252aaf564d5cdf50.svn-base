require 'test_helper'

class MessageTest < ActionMailer::TestCase
  test "forgotPass" do
    mail = Message.forgotPass
    assert_equal "Forgotpass", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
