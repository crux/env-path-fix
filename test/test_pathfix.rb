require 'test/unit'

$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'env-path-fix'

class TestEnvPathFix < Test::Unit::TestCase
  def setup
  end

  def test_new
    assert_not_nil epf = EnvPathFix.new
  end
end

