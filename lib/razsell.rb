require 'razsell/engine'
require 'razsell/results'
require 'razsell/item'
require 'razsell/query'


module Razsell
  def request query, opts={}
    engine = Razsell::Engine.new opts
    engine.request(query)
  end

  def product_lines_for artist, opts={}
    engine = Razsell::Engine.new opts
    engine.product_lines_for artist
  end
end