class Milestone < ActiveRecord::Base
  attr_accessible :reviews_required, :name
  
  has_many :candidates, through: :reviews
  has_many :reviewers, through: :reviews

  def percent_completed
    percentage = ( total_reviews_completed / total_reviews_required ) * 100
    percentage.round(2)
  end

  def total_reviews_required
    reviews.count
  end

  def total_reviews_completed
    completed_reviews.size
  end

  def completed_reviews
    reviews.where(status: "completed")
  end
end