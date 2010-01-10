module Razsell
  class ProductLine
    attr_accessor :id, :name

    def initialize href, name
      @id = strip_id(href)
      @name = name
    end

    def strip_id href
      href.split("cg=")[1]
    end
  end
end
