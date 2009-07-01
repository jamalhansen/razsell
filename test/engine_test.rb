require 'test_helper'
require 'engine'
require 'http_service'

module Razsell
  class EngineTest < Test::Unit::TestCase
    context "basic operations" do
      should "initialize without parameters" do
        engine = Razsell::Engine.new 
      end

      should "accept http_service" do
        http_service = Razsell::HttpService.new
        http_service.expects(:get).once

        engine = Razsell::Engine.new :http_service => http_service
        query = Razsell::Query.new

        engine.request query
      end

      context "getting results" do
        setup do
          http_service = Razsell::HttpService.new
          http_service.expects(:get).once.returns(feed("rockstar"))

          engine = Razsell::Engine.new :http_service => http_service
          query = Razsell::Query.new

          @result = engine.request query
        end

        should "have total item count" do
          assert_equal 3, @result.item_count
        end
      end
    end
  end
end
