class Review < ActiveRecord::Base
  attr_accessible :body, :candidate_id, :reviewer_id, :status, :communication, :reasoning

  belongs_to :candidate
  belongs_to :reviewer
  belongs_to :milestone

  RATINGS = %w( communication reasoning )

  validates :communication, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
  validates :reasoning, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }

  def completed?
    not self.body.blank?
  end

  def total_score
    total = RATINGS.inject(0) do |total, rating|
      total += self.send(rating.to_sym)
    end
    total.to_f / RATINGS.count
  end

end
# == Schema Information
#
# Table name: reviews
#
#  id           :integer         not null, primary key
#  reviewer_id  :integer
#  candidate_id :integer
#  comment      :text
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

