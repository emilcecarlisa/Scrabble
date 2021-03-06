require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player.rb'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'player tests' do

  it 'it takes a players name' do
    # assemble
    new_player = Scrabble::Player.new("Jill")
    # act/assert
    new_player.name.must_equal "Jill"

  end

  #this will only pass if there is nothing in the player_words variable to begin with
  it 'returns words played' do
    #act
    new_word = 'bird'
    #assert
    player_d = Scrabble::Player.new('player_d')
    player_d.play(new_word)
    player_d.plays.must_equal ['bird']

  end

  it "returns false if has won == true" do
    #assert
    player_d = Scrabble::Player.new('player_d')

    player_d.play('zzzzzz')
    player_d.play('zzzzzz')

    player_d.play('pie').must_equal false

  end

  it "returns score of a play/word " do
    word = 'pie'
    #act
    player_d = Scrabble::Player.new('player_d')

    player_d.play(word).must_equal 5

    # puts player_d.play(word)
  end

  it "sums the scores for player" do
    player_d = Scrabble::Player.new('player_d')

    player_d.play('dino') # 5
    player_d.play('pie') # 5
    player_d.play('sock') # 10
    player_d.plays

    player_d.total_score.must_equal 20
  end

  it "tells you if you won" do
    player_d = Scrabble::Player.new('player_d')
    player_d.play( 'zzzzzzz')

    player_d.won?.must_equal true
  end

  it "returns the highest scoring word" do
    player_d = Scrabble::Player.new('player_d')
    player_d.play( 'apple')
    player_d.play( 'zzzzzzz')

    player_d.highest_scoring_word.must_equal 'zzzzzzz'
  end

  it "returns highest word score" do
    player_d = Scrabble::Player.new('player_d')
    player_d.play( 'zzzzzzz')
    player_d.play( 'apple')

    player_d.highest_word_score.must_equal 120
  end


end
