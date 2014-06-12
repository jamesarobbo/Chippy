require 'test_helper'

class StockNotifierTest < ActionMailer::TestCase
  test "stock_level" do
    mail = StockNotifier.stock_level
    assert_equal "Stock level", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
