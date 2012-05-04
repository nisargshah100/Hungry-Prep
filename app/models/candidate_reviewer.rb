class CandidateReviewer < ActiveRecord::Base
  attr_accessible :reviews_required, :name

  belongs_to :candidate
  belongs_to :reviewer  

  validates_uniqueness_of :candidate_id, :scope => :reviewer_id
end