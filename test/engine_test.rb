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
        query = Razsell::Query.new '12345678012345678'

        engine.request query
      end
    end
  end
end
