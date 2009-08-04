require 'query'
require 'results'
require 'item'
require 'engine'
require 'http_service'

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