require 'test_helper'
require 'sort_methods'
require 'grid_cell_sizes'
require 'product_types'



class QueryTest < Test::Unit::TestCase
  context "has defaulted parameters" do
    setup do
      @query = Razsell::Query.new
    end

    should "default sort to popularity" do
      assert_equal Razsell::SortMethods::POPULARITY, @query.sort_type
    end

    should "default page to 1" do
      assert_equal 1, @query.page
    end

    should "default items per page to 50" do
      assert_equal 50, @query.items_per_page
    end

    should "default page limit to 5" do
      assert_equal 5, @query.page_limit
    end

    should "default product type to nil" do
      assert_nil @query.product_type
    end

    should "default image background color to white" do
      assert_equal "FFFFFF", @query.image_background_color
    end

    should "default source to razsell" do
      assert_equal "razsell", @query.source
    end

    should "default opensearch to 1" do
      assert_equal 1, @query.opensearch
    end

    should "default feed type to rss" do
      assert_equal "rss", @query.feed_type
    end
  end

  context "can set parameters" do
    setup do
      @query = Razsell::Query.new
    end

    should "set sort type" do
      @query.sort_type = Razsell::SortMethods::DATE_CREATED
      assert_equal Razsell::SortMethods::DATE_CREATED, @query.sort_type
    end

    should "set image size" do
      @query.image_size = Razsell::GridCellSizes::SMALL
      assert_equal Razsell::GridCellSizes::SMALL, @query.image_size
    end

    should "set grid cell background color" do
      @query.image_background_color = "FFFFFF"
      assert_equal "FFFFFF", @query.image_background_color
    end

    should "set keywords" do
      @query.keywords = "bar"
      assert_equal "bar", @query.keywords
    end

    should "set product type" do
      @query.product_type = Razsell::ProductTypes::MUG
      assert_equal Razsell::ProductTypes::MUG, @query.product_type
    end
  end

  context "base url" do
    should "know base url" do
      @query = Razsell::Query.new
      assert_equal "http://feed.zazzle.com/rss", @query.send(:base_url)
    end

    should "include associate in base url if supplied" do
      @query = Razsell::Query.new.for_associate("kungfutees")
      assert_equal "http://feed.zazzle.com/kungfutees/rss", @query.send(:base_url)
    end
  end

  context "querystring" do
    setup do
      @query = Razsell::Query.new
    end

    should "be alphabetical" do
      qs = @query.to_querystring
      expected = "bg=FFFFFF&ft=rss&isz=large&opensearch=1&pg=1&ps=50&src=razsell&st=popularity"
      assert_equal expected, qs
    end
  end
end
