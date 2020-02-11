require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do #nominal positive

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do
    hand = ["Jack","Queen"]
    score = blackjack_score(hand)
    expect(score).must_equal 20
  end

  it 'calculates aces as 11 where it does not go over 21' do 
    hand = ["Ace",5]
    score = blackjack_score(hand)
    expect(score).must_equal 16
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do 
    hand = ["Ace","Queen",3]
    score = blackjack_score(hand)
    expect(score).must_equal 14
  end

  it 'handles cases of multiple aces correctly' do
    hand = ["Ace","Ace","Ace","Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 14
  end

  it 'raises an ArgumentError for invalid cards' do
    hand = ["sugar"]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
    hand = [7,8,9]
    expect {
      blackjack_score(hand)
  }.must_raise ArgumentError
  end

  it 'raises an ArgumentError on hands larger than 5' do
    hand = [3,4,5,6,7,8]
    expect {
      blackjack_score(hand)
  }.must_raise ArgumentError
  end

  it 'raises an ArgumentError on hands smaller than 1' do
    hand = []
    expect {
      blackjack_score(hand)
  }.must_raise ArgumentError
  end
end
