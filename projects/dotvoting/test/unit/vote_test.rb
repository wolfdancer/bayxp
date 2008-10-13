require File.dirname(__FILE__) + '/../test_helper'

class VoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_a_vote_captures_a_username
    a_vote = Vote.create! :username => "foo"
    a_vote.reload
    assert_equal "foo", a_vote.username
  end

  def test_by_default_a_vote_has_not_ranked_games
    assert_equal [], Vote.create!.ranked_games
  end

  def test_a_vote_can_have_ranked_games
    a_vote = Vote.create!
    first_game = Game.create! :name => "zelda"
    second_game = Game.create! :name => "super mario 64"
    a_vote.ranked_games << RankedGame.new(:game => first_game, :rank => 4)
    a_vote.ranked_games << RankedGame.new(:game => second_game, :rank => 1)
    name_ranks = a_vote.ranked_games.collect {|rg| [rg.game.name, rg.rank]}
    assert_equal([["super mario 64", 1], ["zelda", 4]], (name_ranks.sort))
  end
end
