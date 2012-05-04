class Milestone < ActiveRecord::Base
  attr_accessible :reviews_required, :name
  
  has_many :candidates, through: :reviews
  has_many :reviewers, through: :reviews


  def percent_completed
    total_reviews_complted / total_reviews_required
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