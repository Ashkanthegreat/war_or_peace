require_relative 'test_helper'

class PlayerTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_player_has_attributes
    assert_equal 'Clarisa', @player.name
    assert_equal @deck, @player.deck
  end

  def test_if_player_has_lost
    assert_equal false, @player.has_lost?
  end

  def test_it_can_remove_card
    @player.deck.remove_card
    assert_equal false, @player.has_lost?
    @player.deck.remove_card
    assert_equal false, @player.has_lost?
    @player.deck.remove_card
    assert_equal true, @player.has_lost?
    assert_equal @deck, @player.deck
  end


end
