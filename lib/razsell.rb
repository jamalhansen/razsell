require 'razsell/engine'
require 'razsell/results'
require 'razsell/item'
require 'razsell/query'


module Razsell
  def request query, opts={}
    engine = Razsell::Engine.new opts
    engine.request(query)
  end

  def products_for artist, opts={}
    engine = Razsell::Engine.new opts
    query = Razsell::Query.new.for_artist(artist)
    engine.request(query)
  end
end