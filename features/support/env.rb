$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../test')
require 'razsell'
require 'mocha'
require 'fixtures'
include Fixtures

require 'test/unit/assertions'

World(Test::Unit::Assertions)

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'razsell_mixed_in'
