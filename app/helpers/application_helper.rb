module ApplicationHelper

  def score_to_percentage(score)
    number_to_percentage score, precision: 2
  end

end
