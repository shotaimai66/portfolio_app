require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Progra:情報シェア"
    assert_equal full_title("Help"), "Help | Progra:情報シェア"
  end
end