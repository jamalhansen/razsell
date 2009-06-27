$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'razsell'

require 'test/unit/assertions'

World(Test::Unit::Assertions)

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'razsell_mixed_in'
