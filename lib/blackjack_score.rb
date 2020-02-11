# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  total = 0
  ace_count = 0
  
  if (hand.length) > 5 || (hand.length) < 1
    raise ArgumentError.new("Invalid number of cards in hand.")
  end

  hand.each do |card|
    case card 
    when 'Ace'
      total += 11
      ace_count += 1
    when 'Jack','Queen','King'
      total += 10
    when 2, 3, 4, 5, 6, 7, 8, 9, 10
      total += card
    else
      raise ArgumentError.new("#{card} (#{card.class}) is not a valid card.")
    end

    if total > 21  
      if ace_count > 0 
        while total > 21 && ace_count > 0
          total -= 10
          ace_count -= 1
        end
      else
      raise ArgumentError.new("BUST! Score of #{total}")
      end
    end
  end
  return total
end
