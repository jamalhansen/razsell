require 'test_helper'

class ResultsTest < Test::Unit::TestCase
  context "parsing the rockstar search" do
    setup do
      @results = Razsell::Results.new feed("rockstar")
    end

    should "have an item_count of 3" do
      assert_equal 3, @results.item_count
    end

    should "have 3 itmes" do
      assert_equal 3, @results.items.length
    end

    context "first item" do
      setup do
        @item = @results.items[0]
      end

      should "have the correct title" do
        assert_equal "Ladies Rockstar TShirt", @item.title
      end

      should "have the correct guid" do
        assert_equal "http://www.zazzle.com/ladies_rockstar_tshirt-235898004129790991?gl=kungfutees", @item.guid
      end

      should "have the correct pubDate" do
        assert_equal DateTime.parse("Sat, 02 May 2009 13:06:08 GMT").to_s, @item.pub_date.to_s
      end

      should "have the correct link" do
        assert_equal "http://www.zazzle.com/ladies_rockstar_tshirt-235898004129790991?gl=kungfutees", @item.link
      end

      should "have the correct author" do
        assert_equal "kungfutees", @item.author
      end

      should "have the correct description" do
        assert_equal "Ladies are Rockstar Coders too!", @item.description
      end

      should "have the correct thumbnail url" do
        assert_equal "http://rlv.zcache.com/ladies_rockstar_tshirt-p235898004129790991ojnq_125.jpg", @item.thumbnail_url
      end

      should "have the correct content url" do
        assert_equal "http://rlv.zcache.com/ladies_rockstar_tshirt-p235898004129790991ojnq_500.jpg", @item.content_url
      end

      should "have the correct keywords" do
        assert_contains @item.keywords, 'rockstar'
        assert_contains @item.keywords, 'coder'
        assert_contains @item.keywords, 'ror'
        assert_contains @item.keywords, 'ruby'
        assert_contains @item.keywords, 'on'
        assert_contains @item.keywords, 'rails'
      end

      should "have the correct rating" do
        assert_equal "g", @item.rating
      end
    end
  end
end
