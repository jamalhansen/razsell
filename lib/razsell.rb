require 'query'
require 'results'
require 'item'
require 'sort_methods'

module Razsell
  def request query
    Razsell::Results.new
  end
end