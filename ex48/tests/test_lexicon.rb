require 'ex48/lexicon.rb'
require "test/unit"

class TestLexicon < Test::Unit::TestCase
  def test_directions()
    assert_equal(Lexicon.scan("north"), [['direction', 'north']])
  end
end
