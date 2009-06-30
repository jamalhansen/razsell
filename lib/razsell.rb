require 'query'
require 'results'
require 'item'
require 'sort_methods'
require 'image_sizes'

module Razsell
  def request query
    Razsell::Results.new
  end
end