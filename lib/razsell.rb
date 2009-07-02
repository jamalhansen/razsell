require 'query'
require 'results'
require 'item'
require 'engine'

module Razsell
  def request query, opts={}
    engine = Razsell::Engine.new opts
    engine.request(query)
  end
end