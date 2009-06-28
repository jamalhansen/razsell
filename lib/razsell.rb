require 'query'
require 'results'
require 'item'
require 'sort_methods'
require 'grid_cell_sizes'

module Razsell
  def request query
    Razsell::Results.new
  end
end