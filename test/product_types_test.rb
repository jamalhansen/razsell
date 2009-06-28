require 'test_helper'
require 'product_types'

class ProductTypesTest < Test::Unit::TestCase
  include Razsell::ProductTypes
  
  should "have constants for values" do
    assert_equal "128", BUMPER_STICKER
    assert_equal "137", CARD
    assert_equal "144", MOUSE_PAD
    assert_equal "145", BUTTON 
    assert_equal "146", KEYCHAIN
    assert_equal "147", MAGNET 
    assert_equal "148", HAT
    assert_equal "149", BAG 
    assert_equal "151", TIE
    assert_equal "153", PHOTO_SCULPTURE
    assert_equal "154", APRON
    assert_equal "156", PHOTO_PRINT
    assert_equal "158", CALENDAR
    assert_equal "167", SHOES
    assert_equal "168", MUG 
    assert_equal "172", POSTAGE_STAMP
    assert_equal "186", SKATEBOARD
    assert_equal "217", STICKER 
    assert_equal "228", POSTER
    assert_equal "231", EMBROIDERED_SHIRT
    assert_equal "232", EMBROIDERED_BAG
    assert_equal "233", EMBROIDERED_HAT
    assert_equal "235", T_SHIRT 
    assert_equal "239", POSTCARD
    assert_equal "240", PROFILE_CARD
  end
end

