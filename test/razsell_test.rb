require 'test_helper'

class RazsellTest < Test::Unit::TestCase
  include Razsell

  context "basic operations" do
    setup do
      @query = Razsell::Query.new
    end

    should "return results" do
      http_service = Razsell::HttpService.new
      http_service.expects(:get).once.returns("")

      result = request @query, :http_service => http_service
      assert_equal Razsell::Results, result.class
    end
  end
end
