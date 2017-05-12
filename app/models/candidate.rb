class Candidate < ApplicationRecord

  validates :name, presence: true

  def score
    # TODO
  end

  def absolute_winner?
    # TODO
  end

  class << self

    def winners
      # TODO
    end

  end

end
