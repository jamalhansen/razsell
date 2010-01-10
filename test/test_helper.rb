require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'fixtures'

#$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
#$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'razsell'

require 'mocha'

class Test::Unit::TestCase
  include Fixtures
end

