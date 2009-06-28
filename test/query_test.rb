require 'test_helper'
require 'errors/missing_api_key_error'
require 'sort_methods'
require 'grid_cell_sizes'
require 'product_types'



class QueryTest < Test::Unit::TestCase
  should "require API key on initialize" do
    assert_raise(Razsell::MissingApiKeyError) do
      Razsell::Query.new
    end
  end

  context "has defaulted parameters" do
    setup do
      @query = Razsell::Query.new 123456789012345678
    end

    should "default sort to popularity" do
      assert_equal Razsell::SortMethods::POPULARITY, @query.sort_method
    end

    should "default start page to 1" do
      assert_equal 1, @query.start_page
    end

    should "default items per page to 50" do
      assert_equal 50, @query.items_per_page
    end

    should "default keywords to empty array" do
      assert_equal [], @query.keywords
    end

    should "default product type to nil" do
      assert_nil @query.product_type
    end

    should "default grid cell size to large" do
      assert_equal Razsell::GridCellSizes::LARGE, @query.grid_cell_size
    end

    should "default grid cell background color to white" do
      assert_equal "FFFFFF", @query.grid_cell_background_color
    end
  end

  context "can set parameters" do
    setup do
      @query = Razsell::Query.new 123456789012345678
    end

    should "set popularity" do
      @query.sort_method = Razsell::SortMethods::DATE_CREATED
      assert_equal Razsell::SortMethods::DATE_CREATED, @query.sort_method
    end

    should "set associate" do
      @query.associate = "foo"
      assert_equal "foo", @query.associate
    end

    should "set grid cell size" do
      @query.grid_cell_size = Razsell::GridCellSizes::SMALL
      assert_equal Razsell::GridCellSizes::SMALL, @query.grid_cell_size
    end

    should "set grid cell background color" do
      @query.grid_cell_background_color = "FFFFFF"
      assert_equal "FFFFFF", @query.grid_cell_background_color
    end

    should "set start page" do
      @query.start_page = 2
      assert_equal 2, @query.start_page
    end

    should "set items per page" do
      @query.items_per_page = 8
      assert_equal 8, @query.items_per_page
    end

    should "set keywords" do
      @query.keywords << "bar"
      @query.keywords << "baz"
      assert_equal "bar", @query.keywords[0]
      assert_equal "baz", @query.keywords[1]
    end

    should "set product type" do
      @query.product_type = Razsell::ProductTypes::MUG
      assert_equal Razsell::ProductTypes::MUG, @query.product_type
    end
  end
end
