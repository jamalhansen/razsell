require 'test_helper'
require 'errors/missing_api_key_error'
require 'sort_methods'


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
  end
end
