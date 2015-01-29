require 'test_helper'

class DensitateControllerTest < ActionController::TestCase
  test "should get preluare_text" do
    get :preluare_text
    assert_response :success
  end

  test "should get afisare_rezultate" do
    get :afisare_rezultate
    assert_response :success
  end

end
