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
  end
end
