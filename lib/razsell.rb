require 'query'
require 'results'
require 'item'
require 'engine'

module Razsell
  def request query
    engine = Razsell::Engine.new
    engine.request(query)
  end
end