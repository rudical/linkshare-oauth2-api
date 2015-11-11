require 'test_helper'

class LinkshareTest < ActiveSupport::TestCase
  test "Connection" do
    # assert_kind_of Module, Linkshare
    Linkshare.consumer_key = "LDvfRMkdy0jVskoXQs7UBd_LyeIa"
    Linkshare.consumer_secret = "43fak5CCPakMrv5Hu0fqls3Wrwka"
    Linkshare.sid = "3279068"
    assert_equal "abc", Linkshare.authorize
  end

  # def test_to_squawk_prepends_the_word_squawk
  #   assert_equal "squawk! Hello World", "Hello World".to_squawk
  # end

end
