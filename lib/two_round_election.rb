require 'election'

class TwoRoundElection < Election

  def winner
    return nil if candidates.empty?
    if winner = absolute_winner
      winner
    else
      eliminate_first_round_losers
      second_round_winner
    end
  end

  private

  def absolute_winner
    # TODO
  end

  def eliminate_first_round_losers
    # TODO
  end

  def second_round_winner
    # TODO
  end

end