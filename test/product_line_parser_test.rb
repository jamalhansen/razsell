require 'test_helper'

class ProductLineParserTest < Test::Unit::TestCase
  context "parsing the document" do
    setup do
      @parser = Razsell::ProductLineParser.new
    end

    should "return an empty array when passed nil" do
      section = @parser.parse nil
      assert_equal Array, section.class
      assert_equal 0, section.length
    end

    should "get the relevent text from the document" do
      section = @parser.get_elements feed("productlines")
      assert_equal '<a href="http://www.zazzle.com/kungfutees/gifts?cg=196854021783912655">Cheeze</a>', section[0].to_html
      assert_equal '<a href="http://www.zazzle.com/kungfutees/gifts?cg=196596454716712290">New Products</a>', section[1].to_html
      assert_equal '<a href="http://www.zazzle.com/kungfutees/gifts?cg=196983228798280961">Smim</a>', section[2].to_html
    end

    should "populate the array with ProductLine objects" do
      section = @parser.parse feed("productlines")
      assert_equal '196854021783912655', section[0].id
      assert_equal '196596454716712290', section[1].id
      assert_equal '196983228798280961', section[2].id

      assert_equal 'Cheeze', section[0].name
      assert_equal 'New Products', section[1].name
      assert_equal 'Smim', section[2].name
    end
  end
end
