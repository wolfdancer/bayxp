require File.dirname(__FILE__) + '/../test_helper'

class RankedGameTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_a_ranked_game_is_associated_to_a_game
    ranked_game = RankedGame.create! :game=> Game.new(:name => "name")
    assert_equal "name", ranked_game.game.name
  end
end
