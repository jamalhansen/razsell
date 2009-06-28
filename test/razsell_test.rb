require 'test_helper'

class RazsellTest < Test::Unit::TestCase
  include Razsell

  context "basic operations" do
    setup do
      @query = Razsell::Query.new 123456789012345678
    end

    should "return results" do
      result = request @query
      assert_equal Razsell::Results, result.class
    end
  end
end
