require 'test_helper'

class RazsellMixinTest < Test::Unit::TestCase
  include Razsell::Mixin

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

class RazsellNonMixinTest < Test::Unit::TestCase
  context "basic operations" do
    setup do
      @query = Razsell::Query.new
    end

    should "return results" do
      http_service = Razsell::HttpService.new
      http_service.expects(:get).once.returns("")

      result = Razsell.request @query, :http_service => http_service
      assert_equal Razsell::Results, result.class
    end
  end
end
