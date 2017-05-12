class Candidate < ApplicationRecord

  validates :name, presence: true

  def score
    if (sum = Candidate.sum(:votes)) > 0
      100.0 * votes / sum
    else
      0
    end
  end

  def absolute_winner?
    score > 50
  end

  class << self

    def winners
      if winner = all.find(&:absolute_winner?)
        [winner]
      else
        all.max_by(2, &:score)
      end
    end

  end

end
